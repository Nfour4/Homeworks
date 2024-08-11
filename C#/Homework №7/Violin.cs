using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    internal class Violin : MusicalInstrument
    {
        public Violin(string name, string desc, string history) 
            : base(name, desc, history) { }

        public override void Sound()
        {
            base.Sound();
            Console.WriteLine("*издает протяжый высокий скрипящий звук*");
        }
    }
}
