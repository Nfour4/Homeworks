using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__8
{
    internal class List
    {
        Book[] books;
        int listSize;

        public List(int size)
        {
            listSize = size;
            books = new Book[listSize];
        }
        public int Length
        {
            get { return books.Length; }
        }

        public int this[string name] 
        {
            get
            {
                for (int i = 0; i < books.Length; i++)
                {
                    if (name == books[i].Name)
                        return i;
                }
                return -1;
            }
        }
        public Book this[int index]
        {
            get
            {
                if (index >= 0 && index < books.Length)
                {
                    return books[index];
                }
                throw new IndexOutOfRangeException();
            }
            set
            {
                if (index >= 0 && index < books.Length)
                {
                    books[index] = value;
                    return;
                }
                throw new IndexOutOfRangeException();
            }
        }
        
        public static List operator +(List list, Book b)
        {
            List newList = new List(++list.listSize);

            for (int i = 0; i < newList.Length - 1; i++)
            {
                newList.books[i] = list.books[i];
            }

            newList.books[newList.Length-1] = b;

            return newList;
        }
        public static List operator -(List list, Book b)
        {
            List newList = new List(--list.listSize);

            for (int i = 0; i < newList.Length; i++)
            {
                if (list.books[i].Name == b.Name)
                {
                    for (int j = i; j < list.Length - 1; j++)
                    {
                        newList.books[j] = list.books[i + 1];
                        i++;
                    }
                }
                else
                {
                    newList.books[i] = list.books[i];
                }
            }
            return newList;
        }

        public void SortByName()
        {
            Book temp;
            int count = this.Length;

            while (count > 0)
            {
                for (int i = 0; i < this.Length - 1; i++)
                {
                    int a = Convert.ToInt32(this.books[i].Name[0]);
                    int b = Convert.ToInt32(this.books[i + 1].Name[0]);
                    if (a > b)
                    {
                        temp = new Book(this.books[i + 1].Name, this.books[i + 1].Author);
                        this.books[i + 1] = this.books[i];
                        this.books[i] = temp;
                    }
                    else
                    {
                        continue;
                    }
                }
                count--;
            }
        }
        public void SortByAuthor()
        {
            Book temp;
            int count = this.Length;

            while (count > 0)
            {
                for (int i = 0; i < this.Length - 1; i++)
                {
                    int a = Convert.ToInt32(this.books[i].Author[0]);
                    int b = Convert.ToInt32(this.books[i + 1].Author[0]);
                    if (a > b)
                    {
                        temp = new Book(this.books[i + 1].Name, this.books[i + 1].Author);
                        this.books[i + 1] = this.books[i];
                        this.books[i] = temp;
                    }
                    else
                    {
                        continue;
                    }
                }
                count--;
            }
        }
        public void Find(string name)
        {
            for (int i = 0; i < this.Length; i++)
            {
                if (this[i].Name == name)
                    Console.WriteLine($"Книга, которую вы ищите, " +
                        $"находится в списке под номером {i + 1}: {this.books[i]}");
            }
        }
        public void Print()
        {
            for (int i = 0; i < this.Length; i++)
            {
                Console.WriteLine($"{i+1}." + this[i]);
            }
        }
    }
}
