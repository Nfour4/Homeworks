using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__9
{
    public class Dect
    {
        public Word[] words;
        public int dectSize;
        public Dect(int size)
        {
            dectSize = size;
            words = new Word[dectSize];
        }
        public Dect(Word[] w, int size)
        {
            dectSize = size;
            words = w;
        }
        public void SortAndPrint()
        {
            Array.Sort(words);
            Console.WriteLine("\n\t\t* * *\n");
            foreach (Word word in words)
            {
                word.Print();
                Console.WriteLine();
            }
            Console.WriteLine("\t\t* * *");
        }
        public static Dect operator +(Dect dect, Word word)
        {
            Dect newDect = new Dect(dect.dectSize + 1);

            for (int i = 0; i < newDect.dectSize - 1; i++)
            {
                newDect.words[i] = dect.words[i];
            }

            newDect.words[newDect.dectSize - 1] = word;

            return newDect;
        }
    }
}
