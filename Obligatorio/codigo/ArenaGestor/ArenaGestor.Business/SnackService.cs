using ArenaGestor.BusinessHelpers;
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
        public Snack GetSnackById(int snackId)
        {
            CommonValidations.ValidId(snackId);
            Snack snack = snackManagement.GetSnackById(snackId);
            if (snack == null)
            {
                throw new NullReferenceException("The snack doesn't exists");
            }

            return snack;
        }

        public void DeleteSnack(int snackId)
        {
            CommonValidations.ValidId(snackId);

            Snack snackToDelete = snackManagement.GetSnackById(snackId);
            if (snackToDelete == null)
            {
                throw new NullReferenceException($"The Snack does not exist");
            }
            snackManagement.DeleteSnack(snackToDelete);
            snackManagement.Save();
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