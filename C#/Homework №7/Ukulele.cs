using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    internal class Ukulele : MusicalInstrument
    {
        public Ukulele(string name, string desc, string history)
            : base(name, desc, history) { }
        public override void Sound()
        {
            base.Sound();
            Console.WriteLine("*издает легкий, бренчащий звук \"трынь\"*");
        }
    }
}
