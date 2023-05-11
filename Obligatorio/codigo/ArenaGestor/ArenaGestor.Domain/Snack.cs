using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ArenaGestor.Domain
{
    public class Snack
    {
        public int Id { get; set; }
        
        public string Description { get; set; }
        
        public decimal Price { get; set; }

        public virtual IEnumerable<TicketSnack> Tickets { get; set; }

        public override bool Equals(object obj)
        {
            return obj is Snack snack &&
                   Id == snack.Id;
        }
        
    }
}