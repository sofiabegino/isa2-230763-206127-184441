using ArenaGestor.DataAccessInterface;
using ArenaGestor.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ArenaGestor.DataAccess.Managements
{
    public class SnackManagement : ISnackManagement
    {
        private readonly DbSet<Snack> snacks;
        private readonly DbContext context;
        
        public SnackManagement(DbContext context)
        {
            this.snacks = context.Set<Snack>();
            this.context = context;
        }
        
        public void InsertSnack(Snack snack)
        {
            snacks.Add(snack);
        }
        
        public void Save()
        {
            context.SaveChanges();
        }
    }
}