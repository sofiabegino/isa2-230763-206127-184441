using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.BusinessInterface
{
    public interface ISnackService
    {
        Snack CreateSnack(Snack snack);
        IEnumerable<Snack> GetSnacks();
        void DeleteSnack(int snackId);
        Snack GetSnackById(int snackId);
    }
}