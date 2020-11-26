using BackEnd.Model;
using Microsoft.EntityFrameworkCore;

namespace BackEnd.Repository.SQLite {
    public class EntityFrameworkFotoContext : DbContext
    {
        public EntityFrameworkFotoContext(DbContextOptions<EntityFrameworkFotoContext> options) : base(options)
        {
        }
        public DbSet<Foto> Fotos { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
               builder.Entity<Foto>().HasKey(m => m.uuid);
               base.OnModelCreating(builder);
        }
    }
}