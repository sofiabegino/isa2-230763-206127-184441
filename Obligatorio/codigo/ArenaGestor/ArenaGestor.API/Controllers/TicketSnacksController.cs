using System;
using ArenaGestor.API.Filters;
using ArenaGestor.APIContracts;
using ArenaGestor.APIContracts.TicketSnack;
using ArenaGestor.BusinessInterface;
using ArenaGestor.Domain;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace ArenaGestor.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [ExceptionFilter]
    public class TicketSnacksController: ControllerBase, ITicketSnackAppService
    {
        private readonly ITicketSnackService ticketSnackService;
        private readonly IMapper mapper;
        
        public TicketSnacksController(ITicketSnackService ticketSnackService, IMapper mapper)
        {
            this.ticketSnackService = ticketSnackService;
            this.mapper = mapper;
        }
        
        // post insert ticket snack
        [HttpPost]
        public IActionResult PostTicketSnack([FromBody] TicketSnackInsertDto insertTicketSnack)
        {
            try
            {
                var ticketSnack = mapper.Map<TicketSnack>(insertTicketSnack);
                var result = ticketSnackService.CreateTicketSnack(ticketSnack);
                var resultDto = mapper.Map<TicketSnackResultDto>(result);
                return Ok(resultDto);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
            
        }
    }
}