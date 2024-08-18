using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__9
{
    public class Dect
    {
        public Word[] words;
        public Dect(Word[] w) 
        {
            words = w;
        }
        public void SortByAlphabet()
        {
            Array.Sort(words);
            Console.WriteLine("Слова были отсортированы по алфавиту:\n\t\t* * *");
            foreach (Word word in words)
            {
                Console.WriteLine($"Слово: {word.OriginalWord}, его перевод: {word.TranslatedWord}");
            }
            Console.WriteLine("\t\t* * *");
        }
    }
}
