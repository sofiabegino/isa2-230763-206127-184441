using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.DataAccessInterface
{
    public interface ISnackManagement
    {
        void InsertSnack(Snack snack);
        Snack GetByDescription(string description);
        IEnumerable<Snack> GetAll();
        void Save();
    }
}