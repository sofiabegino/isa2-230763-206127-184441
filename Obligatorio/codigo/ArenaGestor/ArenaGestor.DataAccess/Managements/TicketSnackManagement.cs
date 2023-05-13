using ArenaGestor.DataAccessInterface;
using ArenaGestor.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ArenaGestor.DataAccess.Managements
{
    public class TicketSnackManagement: ITicketSnackManagement
    {
        private readonly DbSet<TicketSnack> ticketSnacks;
        private readonly DbContext context;
        
        public TicketSnackManagement(DbContext context)
        {
            this.ticketSnacks = context.Set<TicketSnack>();
            this.context = context;
        }
        
        public void InsertTicketSnack(TicketSnack ticketSnack)
        {
            ticketSnacks.Add(ticketSnack);
        }
        
        public void Save()
        {
            context.SaveChanges();
        }
    }
}