using FluentAssertions;
using TechTalk.SpecFlow;
using ArenaGestor.Domain;
using ArenaGestor.BusinessInterface;
using ArenaGestor.DataAccessInterface;
using ArenaGestor.Business;
using ArenaGestor.DataAccess;
using ArenaGestor.API.Controllers;
using ArenaGestor.API;
using ArenaGestor.APIContracts.Snack;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System;
using ArenaGestor.DataAccess.Managements;
using AutoMapper;

namespace ArenaGestor.Specs.Steps;

[Binding]
public sealed class SnacksStepDefinitions
{
    private int _id;
    private int _price;
    private string _description;
    private Snack _snack;
    private SnackResultDto _snackResultDto;
    private SnackInsertDto _snackInsertDto;
    private SnackDeleteDto _snackDeleteDto;
    private Snack _oldSnack;
    
    private ISnackManagement _iSnackManagement;
    private ArenaGestorContext _context;
    private Mock<IMapper> _mapperMock;
    
    private string _resultMessage;

    private readonly ScenarioContext _scenarioContext;

    public SnacksStepDefinitions(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
    }

    [Given(@"the description is ""(.*)""")]
    public void GivenTheDescriptionIs(string p0)
    {
        _description = p0;
    }

    [Given(@"the price is (.*)")]
    public void GivenThePriceIs(int p0)
    {
        _price = p0;
    }

    [When(@"I click on the ""(.*)"" button")]
    public void WhenIClickOnTheButton(string p0)
    {
        _snack = new Snack()
        {
            Description = _description,
            Price = _price
        };
        
        var snackInserDto = new SnackInsertDto()
        {
            Description = _description,
            Price = _price
        };
        
        var snackManagementMock = new Mock<ISnackManagement>();
        snackManagementMock.Setup(x => x.InsertSnack(It.IsAny<Snack>()));
        snackManagementMock.Setup(x => x.Save());
        if (_oldSnack != null)
        {
            snackManagementMock.Setup(x => x.GetByDescription(It.IsAny<string>())).Returns(_oldSnack);
        }
        else
        {
            snackManagementMock.Setup(x => x.GetByDescription(It.IsAny<string>())).Returns((Snack)null);
        }
        
        _iSnackManagement = snackManagementMock.Object;
        
        var mapperMock = new Mock<IMapper>();
        mapperMock.Setup(x => x.Map<SnackResultDto>(It.IsAny<Snack>())).Returns(new SnackResultDto()
        {
            Id = 1,
            Description = _snack.Description,
            Price = _snack.Price
        });
        mapperMock.Setup(x => x.Map<Snack>(It.IsAny<SnackInsertDto>())).Returns(_snack);
        
        _mapperMock = mapperMock;
        
        var service = new SnackService(_iSnackManagement);
        var controller = new SnacksController(service, _mapperMock.Object);
        var result = controller.PostSnack(snackInserDto);
        if (result is OkObjectResult)
        {
            _snackResultDto = (SnackResultDto)((OkObjectResult)result).Value;
            _resultMessage = _snackResultDto.Description;
        }
        else
        {
            _resultMessage = ((BadRequestObjectResult)result).Value.ToString();
        }
    }

    [Then(@"I receive a message ""(.*)""")]
    public void ThenIReceiveAMessage(string p0)
    {
        _resultMessage.Should().Be(p0);
    }

    [Given(@"the snack ""(.*)"" already exists")]
    public void GivenTheSnackAlreadyExists(string p0)
    {
        _oldSnack = new Snack()
        {
            Id = 1,
            Description = p0,
            Price = 10
        };
    }

    //Feature Delete Snack//
    [Given(@"the id (.*)")]
    public void GivenTheId(int p0)
    {
        _id = p0;
    }

    [When(@"I click on ""([^""]*)"" button")]
    public void WhenIClickOnButton(string delete)
    {

        var snackManagementMock = new Mock<ISnackManagement>();
        snackManagementMock.Setup(x => x.DeleteSnack(It.IsAny<Snack>()));
        snackManagementMock.Setup(x => x.Save());
        if (_oldSnack != null)
        {
            snackManagementMock.Setup(x => x.GetSnackById(It.IsAny<int>())).Returns(_oldSnack);
        }
        else
        {
            snackManagementMock.Setup(x => x.GetSnackById(It.IsAny<int>())).Returns((Snack)null);
        }

        _iSnackManagement = snackManagementMock.Object;

        var mapperMock = new Mock<IMapper>();
        
        _mapperMock = mapperMock;

        var service = new SnackService(_iSnackManagement);
        var controller = new SnacksController(service, _mapperMock.Object);
        var result = controller.DeleteSnack(_id);
        if (result is OkObjectResult)
        {
            _resultMessage = (string)((OkObjectResult)result).Value;
        }
        else
        {
            _resultMessage = ((BadRequestObjectResult)result).Value.ToString();
        }
    
    }

    [Then(@"I get a message ""([^""]*)""")]
    public void ThenIGetAMessage(string p0)
    {
         _resultMessage.Should().Be(p0);
    }

    [Given(@"the snack with id (.*) does not exist")]
    public void GivenTheSnackWithIdDoesNotExist(int p0)
    {
        _oldSnack = null;
    }


    [Given(@"the snack does exist with id (.*)")]
    public void GivenTheSnackDoesExistWithId(int p0)
    {
        _oldSnack = new Snack()
        {
            Id = p0,
            Description = "Descrip.",
            Price = 10
        };
    }


}