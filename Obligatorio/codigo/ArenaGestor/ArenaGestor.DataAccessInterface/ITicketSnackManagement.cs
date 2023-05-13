using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.DataAccessInterface
{
    public interface ITicketSnackManagement
    {
        void InsertTicketSnack(TicketSnack ticketSnack);
        
        void Save();
    }
}