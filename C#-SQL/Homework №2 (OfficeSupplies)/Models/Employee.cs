using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Дополнение_к_WPF_SQL__Lesson_1.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public override string ToString()
        {
            return $"{Id}, {FirstName}, {LastName}";
        }

        public static Employee FromString(string id,
           string firstName,
           string lastName)
        {
            return new Employee()
            {
                Id = Convert.ToInt32(id),
                FirstName = firstName,
                LastName = lastName,
            };
        }
    }
}
