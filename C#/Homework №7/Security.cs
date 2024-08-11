using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    internal class Security : Worker
    {
        public Security(string name) : base(name) { }
        public override void Print()
        {
            Console.WriteLine($"{Name} - отвечает за безопасность.");
        }
    }
}
