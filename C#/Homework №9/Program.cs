using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__9
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Word[] words = 
            {
                new Word("Энциклопедия", "Encyclopedia"),
                new Word("Азбука", "The ABC"),
                new Word("Интуиция", "Intuition"),
                new Word("Змея", "Snake"),
                new Word("Родина", "Homeland"),
                new Word("Река", "River") 
            };

            Dect dictionary = new Dect(words);

            dictionary.SortByAlphabet();
        }
    }
}
