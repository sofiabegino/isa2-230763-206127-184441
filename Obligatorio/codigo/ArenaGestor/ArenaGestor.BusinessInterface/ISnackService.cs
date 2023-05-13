using ArenaGestor.Domain;
using System;
using System.Collections.Generic;

namespace ArenaGestor.BusinessInterface
{
    public interface ISnackService
    {
        Snack CreateSnack(Snack snack);
        IEnumerable<Snack> GetSnacks();
    }
}