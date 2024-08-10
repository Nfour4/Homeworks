using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace С__Homework__6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Journal journal1 = new Journal("Vouge", "1892", "Модный журнал");
            Journal journal2 = new Journal("Химия и жизнь", "1965", "Научно-популярный журнал");

            journal1.Input();
            journal2.Input();

            journal1.Print();
            journal2.Print();

            try
            {
                if (journal1 > journal2)
                    throw new Exception("Кол-во сотрудников в первом журнале больше, чем во втором.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Сообщение: {ex.Message}");
            }

            try
            {
                if (journal1 < journal2)
                    throw new Exception("Кол-во сотрудников в первом журнале меньше, чем во втором.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Сообщение: {ex.Message}");
            }

            try
            {
                if (journal1 == journal2)
                    throw new Exception("Кол-во сотрудников в первом журнале равно кол-ву сотрудников во втором.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Сообщение: {ex.Message}");
            }

            try
            {
                if (journal1 != journal2)
                    throw new Exception("Кол-во сотрудников в первом журнале НЕ равно кол-ву сотрудников во втором.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Сообщение: {ex.Message}");
            }

            Console.WriteLine("\n--------------------\n");

            journal1 = journal1 + 10;
            journal2 = journal2 - 2;

            journal1.Print();
            journal2.Print();
        }
    }
}
