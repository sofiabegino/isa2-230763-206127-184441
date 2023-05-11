using System.ComponentModel.DataAnnotations;

namespace ArenaGestor.APIContracts.Snack
{
    public class SnackInsertDto
    {
        public string Description { get; set; }
        
        public int Price { get; set; }
    }
}