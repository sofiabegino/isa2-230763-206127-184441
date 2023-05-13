using ArenaGestor.BusinessInterface;
using ArenaGestor.DataAccessInterface;
using ArenaGestor.Domain;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ArenaGestor.Business
{
    public class TicketSnackService: ITicketSnackService
    {
        private readonly ITicketSnackManagement ticketSnackManagement;
        private readonly ISnackManagement snackManagement;
        private readonly ITicketManagement ticketManagement;

        public TicketSnackService(ITicketSnackManagement ticketSnackManagement, ISnackManagement snackManagement, ITicketManagement ticketManagement)
        {
            this.ticketSnackManagement = ticketSnackManagement;
            this.snackManagement = snackManagement;
            this.ticketManagement = ticketManagement;
        }
        
        public TicketSnack CreateTicketSnack(TicketSnack ticketSnack)
        {
            ValidateTicketSnack(ticketSnack);
            
            ticketSnackManagement.InsertTicketSnack(ticketSnack);
            ticketSnackManagement.Save();
            Snack snack = snackManagement.GetAll().Where(s => s.Id == ticketSnack.SnackId).FirstOrDefault();
            ticketSnack.Snack = snack;
            
            return ticketSnack;
        }
        
        private void ValidateTicketSnack(TicketSnack ticketSnack)
        {
            ticketSnack.ValidTicketSnack();
            Ticket ticket = ticketManagement.GetTicketById(ticketSnack.TicketId);
            Snack snack = snackManagement.GetAll().Where(s => s.Id == ticketSnack.SnackId).FirstOrDefault();
            
            if (ticket == null)
            {
                throw new ArgumentException("Ticket not found.");
            }
            if (snack == null)
            {
                throw new ArgumentException("Snack not found.");
            }
        }
    }
}