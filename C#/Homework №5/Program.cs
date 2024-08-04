using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__5
{
    class Journal
    {
        private readonly string _journalName;
        private readonly string _journalYear;
        private readonly string _journalDesc;
        private string _journalPhone;
        private string _journalEmail;

        public Journal() : this("Нет называния",
            "Год основания не указан",
            "Описание журнала отсутствует",
            "Контактный телефон не указан",
            "Контактный e-mail не указан")
        { }
        public Journal(string _journalName,
            string _journalYear, string _journalDesc) :
            this(_journalName, _journalYear, _journalDesc,
            "Контактный телефон не указан",
            "Контактный e-mail не указан")
        {
            this._journalName = _journalName;
            this._journalYear = _journalYear;
            this._journalDesc = _journalDesc;
        }
        public Journal(string _journalName,
            string _journalYear, string _journalDesc, string _journalPhone, string _journalEmail)
        {
            this._journalName = _journalName;
            this._journalYear = _journalYear;
            this._journalDesc = _journalDesc;
            this._journalPhone = _journalPhone;
            this._journalEmail = _journalEmail;
        }

        public string GetName()
        {
            return _journalName;
        }
        public string GetYear()
        {
            return _journalYear;
        }
        public string GetDesc()
        {
            return _journalDesc;
        }
        public void SetPhone(string phone)
        {
            _journalPhone = phone;
        }
        public string GetPhone()
        {
            return _journalPhone;
        }
        public void SetEmail(string email)
        {
            _journalEmail = email;
        }
        public string GetEmail()
        {
            return _journalEmail;
        }
        public void Input()
        {
            Console.Write("Введите телефон, по которому можно обратиться в журнал: ");
            this._journalPhone = Console.ReadLine();

            Console.Write("Введите E-mail журнала: ");
            this._journalEmail = Console.ReadLine();
            Console.WriteLine();
        }
        public void Print()
        {
            Console.Write($"Журнал:\n " +
                $"Имя: {this._journalName}\n " +
                $"Год основания: {this._journalYear}\n " +
                $"Описание журнала: {this._journalDesc}\n " +
                $"Телефон: {this._journalPhone}\n " +
                $"E-mail: {this._journalEmail}");
        }
    }
    class Shop
    {
        private const string _shopName = "Макдональдс";
        private readonly string _shopAdress;
        private readonly string _shopDesc;
        private string _shopPhone;
        private const string _shopEmail = "corporate.mcdonalds.com";

        public Shop() : this("Адрес не указан", "Описание магазина отсутствует", "Контактный телефон не указан") { }
        public Shop(string _shopAdress, string _shopDesc) : this(_shopAdress, _shopDesc, "Контактный телефон не указан")
        {
            this._shopAdress = _shopAdress;
            this._shopDesc = _shopDesc;
        }
        public Shop(string _shopAdress, string _shopDesc, string _shopPhone)
        {
            this._shopAdress = _shopAdress;
            this._shopDesc = _shopDesc;
            this._shopPhone = _shopPhone;
        }
        public string GetName()
        {
            return _shopName;
        }
        public string GetAdress()
        {
            return _shopAdress;
        }
        public string GetDesc()
        {
            return _shopDesc;
        }
        public void SetPhone(string phone)
        {
            _shopPhone = phone;
        }
        public string GetPhone()
        {
            return _shopPhone;
        }
        public string GetEmail()
        {
            return _shopEmail;
        }
        public void Input()
        {
            Console.Write("Введите телефон, по которому можно обратиться в магазин: ");
            this._shopPhone = Console.ReadLine();
            Console.WriteLine();
        }
        public void Print()
        {
            Console.Write($"Магазин:\n " +
                $"Имя: {_shopName}\n " +
                $"Адрес филиала: {this._shopAdress}\n " +
                $"Описание магазина: {this._shopDesc}\n " +
                $"Телефон филиала: {this._shopPhone}\n " +
                $"E-mail: {_shopEmail}");
        }
        internal class Program
        {
            static void Main(string[] args)
            {
                // Задание №5. Создайте класс «Журнал». Необходимо хранить в полях класса:
                // название журнала, год основания, описание журнала, контактный телефон, контактный e-mail.
                // Реализуйте методы класса для ввода данных, вывода данных, реализуйте доступ к отдельным полям через методы класса.

                Journal journal = new Journal("Vouge", "1892", "Модный журнал");

                journal.Input();
                journal.Print();

                Console.WriteLine("\n----------------------------");

                // Задание №6. Создайте класс «Магазин». Необходимо хранить в полях класса:
                // название магазина, адрес, описание профиля магазина, контактный телефон, контактный e-mail.
                // Реализуйте методы класса для ввода данных, вывода данных, реализуйте доступ к отдельным полям через методы класса.

                Shop mac1 = new Shop("ул. Гагарина, 2Б", "Макдональдс в центре");
                mac1.Input();
                mac1.Print();

                Console.WriteLine("\n");

                Shop mac2 = new Shop("просп. Ленина, 74", "Макдональдс на выезде");
                mac2.Input();
                mac2.Print();

                Console.ReadKey();
            }
        }
    }
}

