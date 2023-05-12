using ArenaGestor.APIContracts.Snack;
using Microsoft.AspNetCore.Mvc;

namespace ArenaGestor.APIContracts
{
    public interface ISnacksAppService
    {
        IActionResult PostSnack(SnackInsertDto insertSnack);
    }
}