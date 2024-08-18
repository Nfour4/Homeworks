using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__9
{
    public class Word : IComparable
    {
        public string OriginalWord { get; }
        public string TranslatedWord { get; set; }
        public Word(string original, string translated )
        {
            OriginalWord = original;
            TranslatedWord = translated;
        }
        public int CompareTo(object o)
        {
            if (o is Word)
            { 
                return OriginalWord.CompareTo((o as Word).OriginalWord);
            }
            throw new ArgumentException("Некорректное значение параметра");
        }
    }
}
