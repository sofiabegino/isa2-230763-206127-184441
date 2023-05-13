using ArenaGestor.BusinessInterface;
using ArenaGestor.DataAccessInterface;
using ArenaGestor.Domain;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ArenaGestor.Business
{
    public class SnackService : ISnackService
    {
        private readonly ISnackManagement snackManagement;
        
        public SnackService(ISnackManagement snackManagement)
        {
            this.snackManagement = snackManagement;
        }
        
        public Snack CreateSnack(Snack snack)
        {
            ValidateSnack(snack);
            
            snackManagement.InsertSnack(snack);
            snackManagement.Save();
            
            return snack;
        }

        public IEnumerable<Snack> GetSnacks()
        {
             return snackManagement.GetAll();
        }

        private void ValidateSnack(Snack snack)
        {
            snack.ValidSnack();
            ValidateSnackDescriptionIsUnique(snack.Description);
        }
        
        private void ValidateSnackDescriptionIsUnique(string description)
        {
            if (snackManagement.GetByDescription(description) != null)
            {
                throw new ArgumentException("Snack description already exists.");
            }
        }
    }
}