using ArenaGestor.APIContracts.Snack;

namespace ArenaGestor.APIContracts.TicketSnack
{
    public class TicketSnackResultDto
    {
        public int Id { get; set; }
        
        public int Quantity { get; set; }
        
        public string TicketId { get; set; }
        
        public SnackResultDto Snack { get; set; }
    }
}