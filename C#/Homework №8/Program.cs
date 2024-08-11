using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__8
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List booksList = new List(5);
            int choice;
            string bName, bAuthor;

            booksList[0] = new Book ("Война и мир", "Толстой Л.Н." );
            booksList[1] = new Book ("Незнайка на луне", "Носов Н.Н.");
            booksList[2] = new Book ("Преступление и наказание", "Достоевский Ф.М.");
            booksList[3] = new Book ("Мцыри", "Лермонтов М.Ю.");
            booksList[4] = new Book ("Драма на охоте", "Чехов А.П.");

            Console.WriteLine("Изначальный список книг:");
            booksList.Print();
            Console.WriteLine();

            Console.WriteLine("Меню: ");
            Console.WriteLine("1. Добавить книгу в список.");
            Console.WriteLine("2. Удалить книгу из списка.");
            Console.WriteLine("3. Поиск книги по названию.");
            Console.WriteLine("4. Сортировка по названию.");
            Console.WriteLine("5. Сортировка по автору.");
            Console.WriteLine("6. Выход.");

            do
            {
                Console.Write("\nВаш выбор: ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.Write("\nВведите название книги: ");
                        bName = Console.ReadLine();
                        Console.Write("\nВведите автора книги: ");
                        bAuthor = Console.ReadLine();
                        Console.WriteLine();

                        Book book = new Book { Name = bName, Author = bAuthor };

                        booksList = booksList + book;

                        Console.WriteLine("Книга была добавлена в список. Новый список: ");
                        booksList.Print();

                        break;
                    case 2:
                        Console.Write("\nВведите название книги: ");
                        bName = Console.ReadLine();
                        Console.WriteLine();

                        int index = booksList[bName];

                        booksList = booksList - booksList[index];

                        Console.WriteLine("Книга с данным названием была удалена. Новый список: ");
                        booksList.Print();

                        break;
                    case 3:
                        Console.Write("\nВведите название книги: ");
                        bName = Console.ReadLine();
                        Console.WriteLine();

                        Console.WriteLine("Текущий список: ");
                        booksList.Print();
                        Console.WriteLine();

                        booksList.Find(bName);

                        break;
                    case 4:
                        booksList.SortByName();

                        Console.WriteLine("\nCписок был отсортирован по названию: ");
                        booksList.Print();

                        break;
                    case 5:
                        booksList.SortByAuthor();

                        Console.WriteLine("\nCписок был отсортирован по автору: ");
                        booksList.Print();

                        break;
                }
            } while (choice != 6);

            Console.WriteLine("\nВсего доброго!\n");
        }
    }
}
