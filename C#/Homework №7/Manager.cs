using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    internal class Manager : Worker
    {
        public Manager(string name) : base(name) { }
        public override void Print()
        {
            Console.WriteLine($"{Name} - на нём продажи готового товара.");
        }
    }
}
