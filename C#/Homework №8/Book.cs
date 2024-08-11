using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__8
{
    internal class Book
    {
        public string Name { get; set; }
        public string Author { get; set; }

        public Book() : this(" ", " ") { }
        public Book(string bName, string bAuthor) { Name = bName; Author = bAuthor; }

        public override string ToString()
        {
            return $"Книга \"{Name}\" от автора {Author}";
        }
    }
}
