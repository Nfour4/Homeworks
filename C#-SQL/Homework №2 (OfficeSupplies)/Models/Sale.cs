using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Дополнение_к_WPF_SQL__Lesson_1.Models
{
    internal class Sale
    {
        public int Id { get; set; }
        public Product SProduct { get; set; }
        public Employee SEmployee { get; set; }
        public string CustomerName { get; set; }
        public int Quantity { get; set; }

        public override string ToString()
        {
            return $"{Id}, {SProduct.Id}, {SEmployee.Id}, {CustomerName}, {Quantity}";
        }

        public static Sale FromString(SqlDataReader reader)
        {
            return new Sale()
            {
                Id = Convert.ToInt32(reader[0]),
                SEmployee = Employee.FromString(reader[1].ToString(), reader[2].ToString(), reader[3].ToString()),
                SProduct = Product.FromString(reader[4].ToString(), reader[5].ToString(), reader[6].ToString(),
                reader[7].ToString(), reader[8].ToString(), reader[9].ToString()),
                CustomerName = reader[10].ToString(),
                Quantity = Convert.ToInt32(reader[11].ToString())
            };
        }
    }
}
