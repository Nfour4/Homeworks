using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__4
{
    class WebSite
    {
        private string _siteName;
        private string _sitePath;
        private string _siteDesc;
        private string _siteIp;

        public WebSite() : this("Нет имени", "Путь не указан", "Описание отсутствует", "IP-адресс отсутствует") {}
        public WebSite(string _siteName, string _sitePath, string _siteDesc, string _siteIp)
        {
            this._siteName = _siteName;
            this._sitePath = _sitePath;
            this._siteDesc = _siteDesc;
            this._siteIp = _siteIp;
        }
        public void SetName(string name)
        {
            _siteName = name;
        }
        public string GetName()
        {
            return _siteName;
        }   
        public void SetPath(string path)
        {
            _sitePath = path;
        }
        public string GetPath()
        {
            return _sitePath;
        }  
        public void SetDesc(string desc)
        {
            _siteDesc = desc;
        }
        public string GetDesc()
        {
            return _siteDesc;
        }
        public void SetIp(string ip)
        {
            _siteIp = ip;
        }
        public string GetIp()
        {
            return _siteIp;
        }
        public void Input()
        {
            Console.Write("Введите имя сайта: ");
            this._siteName = Console.ReadLine();

            Console.Write("Введите путь к сайту: ");
            this._sitePath = Console.ReadLine();

            Console.Write("Введите описание сайта: ");
            this._siteDesc = Console.ReadLine();

            Console.Write("Введите IP-адрес сайта: ");
            this._siteIp = Console.ReadLine();
            Console.WriteLine();
        }
        public void Print()
        {
            Console.Write($"Ваш сайт:\n " +
                $"Имя: {this._siteName}\n " +
                $"Путь: {this._sitePath}\n " +
                $"Описание: {this._siteDesc}\n " +
                $"IP: {this._siteIp}"); 
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            // Задание 1. Напишите метод, который отображает квадрат из некоторого символа.
            // Метод принимает в качестве параметра: длину стороны квадрата, символ.

            Console.Write("Введите символ: ");
            string symbol = Console.ReadLine();
            Console.WriteLine();

            Console.Write("Введите длину квадрата: ");
            int length = Convert.ToInt32(Console.ReadLine());

            PrintQ(symbol, length);

            // Задание 4. Создайте класс «Веб-сайт». Необходимо хранить в полях класса:
            // название сайта, путь к сайту, описание сайта, ip адрес сайта.
            // Реализуйте методы класса для ввода данных, вывода данных,
            // реализуйте доступ к отдельным полям через методы класса.

            WebSite webSite = new WebSite();

            webSite.Input();
            webSite.Print();


            Console.ReadKey();
        }
        static void PrintQ (string s, int length)
        {
            for (int i = 0; i < length; i++)
            {
                for (int j = 0; j < length; j++)
                {
                    Console.Write(s + " ");
                }
                Console.WriteLine();
            }
        }
    }
}
