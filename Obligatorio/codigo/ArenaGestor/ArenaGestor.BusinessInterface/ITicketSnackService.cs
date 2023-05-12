using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.BusinessInterface
{
    public interface ITicketSnackService
    {
        TicketSnack CreateTicketSnack(TicketSnack ticketSnack);
    }
}