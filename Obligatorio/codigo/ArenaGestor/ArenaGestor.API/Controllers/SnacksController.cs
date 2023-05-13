using System;
using ArenaGestor.API.Filters;
using ArenaGestor.APIContracts;
using ArenaGestor.APIContracts.Snack;
using ArenaGestor.BusinessInterface;
using ArenaGestor.Domain;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using ArenaGestor.Business;


namespace ArenaGestor.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [ExceptionFilter]
    public class SnacksController: ControllerBase, ISnacksAppService
    {
        private readonly ISnackService snackService;
        private readonly IMapper mapper;
        
        public SnacksController(ISnackService snackService, IMapper mapper)
        {
            this.snackService = snackService;
            this.mapper = mapper;
        }
        
        // post insert snack
        [HttpPost]
        public IActionResult PostSnack([FromBody] SnackInsertDto insertSnack)
        {
            try
            {
                var snack = mapper.Map<Snack>(insertSnack);
                var result = snackService.CreateSnack(snack);
                var resultDto = mapper.Map<SnackResultDto>(result);
                return Ok(resultDto);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
            
        }

        [HttpGet]
        public IActionResult GetSnacks()
        {
            var result = snackService.GetSnacks();
            var resultDto = mapper.Map<IEnumerable<SnackResultDto>>(result);
            return Ok(resultDto);
        }
    }
}