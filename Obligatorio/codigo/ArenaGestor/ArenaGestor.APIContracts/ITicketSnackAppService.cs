using ArenaGestor.APIContracts.TicketSnack;
using Microsoft.AspNetCore.Mvc;

namespace ArenaGestor.APIContracts
{
    public interface ITicketSnackAppService
    {
        IActionResult PostTicketSnack(TicketSnackInsertDto insertTicketSnack);
    }
}