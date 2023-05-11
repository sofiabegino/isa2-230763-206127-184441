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
            snackManagement.InsertSnack(snack);
            snackManagement.Save();
            return snack;
        }
    }
}