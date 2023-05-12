using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.BusinessInterface
{
    public interface ISnackService
    {
        Snack CreateSnack(Snack snack);
        void DeleteSnack(int snackId);
        Snack GetSnackById(int snackId);
    }
}