using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options)
        : base(options)
        {
            
        }

        public DbSet<Entity> Entities { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Entity>().ToTable("Entity");
        }
    }

    public class Entity
    {
        public int Id { get; set; }

        public Entity(int id)
        {
            Id = id;
        }
    }

    public static class DbInitializer
    {
        public static void Initialize(DataContext context)
        {
            context.Database.EnsureCreated();

            if (context.Entities.Any())
            {
                return;
            }

            var entities = new Entity[]
            {
                new Entity(1)
            };

            foreach (var item in entities)
            {
                context.Entities.Add(item);
            }

            context.SaveChanges();
        }
    }
}
