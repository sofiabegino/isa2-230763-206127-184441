using ArenaGestor.API.Filters;
using ArenaGestor.APIContracts;
using ArenaGestor.APIContracts.Snack;
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
    public class SnackController: ControllerBase
    {
        private readonly ISnackService snackService;
        private readonly IMapper mapper;
        
        public SnackController(ISnackService snackService, IMapper mapper)
        {
            this.snackService = snackService;
            this.mapper = mapper;
        }
        
        // post insert snack
        [HttpPost]
        public IActionResult PostSnack([FromBody] SnackInsertDto insertSnack)
        {
            var snack = mapper.Map<Snack>(insertSnack);
            var result = snackService.CreateSnack(snack);
            var resultDto = mapper.Map<SnackResultDto>(result);
            return Ok(resultDto);
        }
    }
}