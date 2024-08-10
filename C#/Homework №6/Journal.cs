using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace С__Homework__6
{
    class Journal
    {
        private readonly string _journalName;
        private readonly string _journalYear;
        private readonly string _journalDesc;
        private string JournalPhone { get; set; }
        private string JournalEmail { get; set; }
        private int EmployeeCount { get; set; }

        public Journal() : this("Нет называния",
            "Год основания не указан",
            "Описание журнала отсутствует",
            "Контактный телефон не указан",
            "Контактный e-mail не указан", 0)
        { }
        public Journal(string _journalName,
            string _journalYear, string _journalDesc) :
            this(_journalName, _journalYear, _journalDesc,
            "Контактный телефон не указан",
            "Контактный e-mail не указан", 0)
        {
            this._journalName = _journalName;
            this._journalYear = _journalYear;
            this._journalDesc = _journalDesc;
        }
        public Journal(string _journalName,
            string _journalYear, string _journalDesc, string _journalPhone, string _journalEmail, int _employeeCount)
        {
            this._journalName = _journalName;
            this._journalYear = _journalYear;
            this._journalDesc = _journalDesc;
            this.JournalPhone = _journalPhone;
            this.JournalEmail = _journalEmail;
            this.EmployeeCount = _employeeCount;
        }
        public static Journal operator +(Journal j, int value)
        {
            j.EmployeeCount += value;
            return j;
        }  
        public static Journal operator -(Journal j, int value)
        {
            j.EmployeeCount -= value;
            return j;
        }
        public override bool Equals(Object o)
        {
            return this.ToString() == o.ToString();
        }
        public override int GetHashCode()
        {
            return this.ToString().GetHashCode();
        }
        public static bool operator ==(Journal j1, Journal j2)
        {
            return j1.EmployeeCount.Equals(j2.EmployeeCount);
        }
        public static bool operator !=(Journal j1, Journal j2)
        {
            return !j1.EmployeeCount.Equals(j2.EmployeeCount);
        } 
        public static bool operator >(Journal j1, Journal j2)
        {
            if (j1.EmployeeCount > j2.EmployeeCount) return true;
            return false;
        }
        public static bool operator <(Journal j1, Journal j2)
        {
            if (j1.EmployeeCount < j2.EmployeeCount) return true;
            return false;
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
        public void Input()
        {
            Console.Write("Введите телефон, по которому можно обратиться в журнал: ");
            this.JournalPhone = Console.ReadLine();

            Console.Write("Введите E-mail журнала: ");
            this.JournalEmail = Console.ReadLine();   
            
            Console.Write("Введите количество сотрудников: ");
            string c = Console.ReadLine();
            this.EmployeeCount = Convert.ToInt32(c);
            Console.WriteLine();
        }
        public void Print()
        {
            Console.Write($"Журнал:\n " +
                $"Имя: {this._journalName}\n " +
                $"Год основания: {this._journalYear}\n " +
                $"Описание журнала: {this._journalDesc}\n " +
                $"Телефон: {this.JournalPhone}\n " +
                $"E-mail: {this.JournalEmail}\n" + 
                $" Кол-во сотрудников: {this.EmployeeCount}\n\n");
        }
    }
}
