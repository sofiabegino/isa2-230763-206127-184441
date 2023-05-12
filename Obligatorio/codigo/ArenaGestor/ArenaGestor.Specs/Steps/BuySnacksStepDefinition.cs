using FluentAssertions;
using TechTalk.SpecFlow;
using ArenaGestor.Domain;
using ArenaGestor.BusinessInterface;
using ArenaGestor.DataAccessInterface;
using ArenaGestor.Business;
using ArenaGestor.DataAccess;
using ArenaGestor.API.Controllers;
using ArenaGestor.API;
using ArenaGestor.APIContracts.TicketSnack;
using ArenaGestor.APIContracts.Snack;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System;
using ArenaGestor.DataAccess.Managements;
using AutoMapper;

namespace ArenaGestor.Specs.Steps;

[Binding]
public sealed class BuySnacksStepDefinition
{
    private Guid _ticketId;
    private bool _incorrectTicketId;
    private int _snackId;
    private bool _incorrectSnackId;
    private int _quantity;
    private string _resultMessage;
    
    private Mock<IMapper> _mapperMock;

    private readonly ScenarioContext _scenarioContext;

    public BuySnacksStepDefinition(ScenarioContext scenarioContext)
    {
        _scenarioContext = scenarioContext;
    }

    [Given(@"the ticket id is ""(.*)""")]
    public void GivenTheTicketIdIs(string p0)
    {
        _ticketId = Guid.Parse(p0);
    }

    [Given(@"the snack id is (.*)")]
    public void GivenTheSnackIdIs(int p0)
    {
        _snackId = p0;
    }

    [Given(@"the quantity is (.*)")]
    public void GivenTheQuantityIs(int p0)
    {
        _quantity = p0;
    }
    
    
    [Given(@"the ticket does not exist")]
    public void GivenTheTicketDoesNotExist()
    {
        _incorrectTicketId = true;
    }

    [Given(@"the snack does not exist")]
    public void GivenTheSnackDoesNotExist()
    {
        _incorrectSnackId = true;
    }

    [When(@"the user buys the snack")]
    public void WhenTheUserBuysTheSnack()
    {
        Snack snack = new Snack()
        {
            Id = _snackId,
            Description = "Teste",
            Price = 10
        };
        
        Ticket ticket = new Ticket()
        {
            TicketId = _ticketId,
            TicketStatusId = TicketCode.Comprado,
            Email = "test@test.com",
            ConcertId = 1,
            Amount = 1
        };
        
        var TicketSnackInsertDto = new TicketSnackInsertDto()
        {
            TicketId = _ticketId,
            SnackId = _snackId,
            Quantity = _quantity
        };
        
        var snackManagementMock = new Mock<ISnackManagement>();
        var ticketManagementMock = new Mock<ITicketManagement>();
        var ticketSnackManagementMock = new Mock<ITicketSnackManagement>();
        var mapperMock = new Mock<IMapper>();

        if (_incorrectTicketId)
        {
            ticketManagementMock.Setup(x => x.GetTicketById(_ticketId)).Returns((Ticket)null);
        }
        else
        {
            ticketManagementMock.Setup(x => x.GetTicketById(_ticketId)).Returns(ticket);
        }

        if (_incorrectSnackId)
        {
            snackManagementMock.Setup(x => x.GetAll()).Returns(new List<Snack>());
        }
        else
        {
            snackManagementMock.Setup(x => x.GetAll()).Returns(new List<Snack>() { snack });
        }
        ticketSnackManagementMock.Setup(x => x.InsertTicketSnack(It.IsAny<TicketSnack>()));
        ticketSnackManagementMock.Setup(x => x.Save());
        mapperMock.Setup(x => x.Map<TicketSnackResultDto>(It.IsAny<TicketSnack>())).Returns(new TicketSnackResultDto()
        {
            Id = 1,
            Quantity = 1,
            TicketId = _ticketId.ToString(),
            Snack = new SnackResultDto()
            {
                Id = _snackId,
                Description = "Teste",
                Price = 10
            }
        });
        mapperMock.Setup(x => x.Map<TicketSnack>(It.IsAny<TicketSnackInsertDto>())).Returns(new TicketSnack()
        {
            TicketId = _ticketId,
            SnackId = _snackId,
            Quantity = _quantity
        });
        
        var service = new TicketSnackService(ticketSnackManagementMock.Object, snackManagementMock.Object, ticketManagementMock.Object);
        var controller = new TicketSnacksController(service, mapperMock.Object);
        var result = controller.PostTicketSnack(TicketSnackInsertDto);
        
        if (result is OkObjectResult)
        {
            var _ticketSnackResultDto = (TicketSnackResultDto)((OkObjectResult)result).Value;
            // "Snack 1 with quantity 1 bought successfully"
            _resultMessage = $"Snack {_ticketSnackResultDto.Snack.Id} with quantity {_ticketSnackResultDto.Quantity} bought successfully";
        }
        else
        {
            _resultMessage = ((BadRequestObjectResult)result).Value.ToString();
        }
    }

    [Then(@"I then receive a message ""(.*)""")]
    public void ThenIThenReceiveAMessage(string p0)
    {
        _resultMessage.Should().Be(p0);
    }

}