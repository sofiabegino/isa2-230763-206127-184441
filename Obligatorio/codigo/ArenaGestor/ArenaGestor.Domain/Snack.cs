using System;
using ArenaGestor.BusinessHelpers;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ArenaGestor.Domain
{
    public class Snack
    {
        public int Id { get; set; }
        
        public string Description { get; set; }
        
        public int Price { get; set; }

        public virtual IEnumerable<TicketSnack> Tickets { get; set; }

        
        public override bool Equals(object obj)
        {
            // same description
            return obj is Snack other
                && (Id == other.Id ||
                (!string.IsNullOrEmpty(Description) && !string.IsNullOrEmpty(other.Description) && Description.Trim().ToUpper() == other.Description.Trim().ToUpper()));
        }
        
        public void ValidSnack()
        {
            if (!CommonValidations.ValidRequiredString(this.Description))
            {
                throw new ArgumentException("The description must have at least one character");
            }
            if (this.Description.Length > 50)
            {
                throw new ArgumentException("Description must be less than 50 characters");
            }
            if (this.Price <= 0)
            {
                throw new ArgumentException("Price must be greater than 0");
            }
        }
        
    }
}