using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__4__LINQ_To_SQL_
{
    public class CountriesDataContext : DataContext
    {
        public Table<Country> Countries;
        public CountriesDataContext(string connectionString) : base(connectionString) { }
    }
}
