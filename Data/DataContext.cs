using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csharp002_webapi.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) {}

        public DbSet<Character> Characters => Set<Character>();

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            var builder = WebApplication.CreateBuilder();
            // optionsBuilder.UseOracle(builder.Configuration.GetConnectionString("OracleConnection"));
            optionsBuilder.UseMySQL(builder.Configuration.GetConnectionString("MySqlConnection"));
        }
    }
}