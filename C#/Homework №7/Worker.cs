using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    abstract class Worker
    {
        protected string Name { get; }

        protected Worker(string name)
        {
            Name = name;
        }
        public abstract void Print();
    }
}
