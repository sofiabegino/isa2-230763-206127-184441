using System;
using System.ComponentModel.DataAnnotations;

namespace ArenaGestor.APIContracts.TicketSnack
{
    public class TicketSnackInsertDto
    {
        public int Quantity { get; set; }
        
        public Guid TicketId { get; set; }
        
        public int SnackId { get; set; }
    }
}