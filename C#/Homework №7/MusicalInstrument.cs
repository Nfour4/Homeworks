using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework__7
{
    public class MusicalInstrument
    {
        protected string name;
        protected string desc;
        protected string history;

        protected MusicalInstrument() 
            : this("Имя отсутствует.", "Описание отсутствует.", "История отсутствует.") { }
        protected MusicalInstrument(string insName) 
            : this(insName, "Описание отсутствует.", "История отсутствует.") { }
        protected MusicalInstrument(string insName, string insDesc) 
            : this(insName, insDesc, "История отсутствует.") { }
        protected MusicalInstrument(string insName, string insDesc, string insHistory)
        {
            name = insName;
            desc = insDesc;
            history = insHistory;
        }

        public virtual void Sound()
        {
            Console.Write("Звук инструмента: ");
        }
        public void Show()
        {
            Console.WriteLine("Название инструмента: " + name);
        }
        public void Desc()
        {
            Console.WriteLine("Описание инструмента: " + desc);
        }
        public void History()
        {
            Console.WriteLine("История инструмента:\n" + history);
        }

    }
}
