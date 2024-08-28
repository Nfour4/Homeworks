using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__9
{
    public class Word : IComparable
    {
        public string OriginalWord { get; set; }
        public string[] TranslatedWords { get; set; }
        public Word() : this(null, null) { }
        public Word(string original, string[] translated)
        {
            OriginalWord = original;
            TranslatedWords = translated;
        }
        public int CompareTo(object o)
        {
            if (o is Word)
            { 
                return OriginalWord.CompareTo((o as Word).OriginalWord);
            }
            throw new ArgumentException("Некорректное значение параметра");
        }
        public void Print()
        {
            Console.Write($"Слово: {OriginalWord}, его перевод(ы): \n");
            foreach (string s in TranslatedWords)
            {
                Console.WriteLine(" -" + s);
            }
            Console.WriteLine();
        }
        
    }
}
