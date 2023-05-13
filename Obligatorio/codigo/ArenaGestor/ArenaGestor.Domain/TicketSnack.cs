using System;
using System.ComponentModel.DataAnnotations;

namespace ArenaGestor.Domain
{
    public class TicketSnack
    {
        public int Id { get; set; }
        
        public int Quantity { get; set; }
        
        public Ticket Ticket { get; set; }
        
        public Guid TicketId { get; set; }
        
        public Snack Snack { get; set; }
        
        public int SnackId { get; set; }
        
        public void ValidTicketSnack()
        {
            if (this.Quantity <= 0)
            {
                throw new ArgumentException("Quantity must be greater than 0");
            }
        }
    }
}