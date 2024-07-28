using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace С__Homework__1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Переменные, общие для некоторых заданий
            string enteringString;

            Console.WriteLine("Задание №1");

            string numberString;
            Console.Write("Enter your number: ");
            numberString = Console.ReadLine();
            int number = Convert.ToInt32(numberString);
            if (number < 1 || number > 100)
                Console.WriteLine("Error!");
            else if (number % 3 == 0 && number % 5 == 0)
                Console.WriteLine("Fizz Buzz!");
            else if (number % 3 == 0)
                Console.WriteLine("Fizz!");
            else if (number % 5 == 0)
                Console.WriteLine("Buzz!");
            else
                Console.WriteLine(number);

            Console.WriteLine("--------------\n");

            Console.WriteLine("Задание №2");

            double numberP, percent;

            Console.Write("Enter your number: ");
            enteringString = Console.ReadLine();
            numberP = Convert.ToDouble(enteringString);
            Console.WriteLine();

            Console.Write("Enter percent: ");
            enteringString = Console.ReadLine();
            percent = Convert.ToDouble(enteringString);
            Console.WriteLine();

            Console.Write("Answer: " + (numberP / 100) * percent);
            
            Console.WriteLine("\n--------------\n");

            Console.WriteLine("Задание №3");

            int num1, num2, num3, num4;

            Console.Write("Enter number 1: ");
            enteringString = Console.ReadLine();
            num1 = Convert.ToInt32(enteringString);
            
            Console.Write("Enter number 2: ");
            enteringString = Console.ReadLine();
            num2 = Convert.ToInt32(enteringString);
            
            Console.Write("Enter number 3: ");
            enteringString = Console.ReadLine();
            num3 = Convert.ToInt32(enteringString);
            
            Console.Write("Enter number 4: ");
            enteringString = Console.ReadLine();
            num4 = Convert.ToInt32(enteringString);
            Console.WriteLine();

            Console.Write("Answer: " + ((num1*1000) + (num2 * 100) + (num3 * 10) + num4));

            Console.WriteLine("\n--------------\n");

            Console.WriteLine("Задание №6");

            string choise;
            double temperature;

            Console.Write("Enter temperature: ");
            enteringString = Console.ReadLine();
            temperature = Convert.ToDouble(enteringString);

            Console.Write("Your choise: ");
            choise = Console.ReadLine();

            if (choise == "f")
                Console.WriteLine("Entered temperature is in Celsium. In Fahrenheit it will be: " + ((1.8 * temperature) + 32));
            else if (choise == "c")
                Console.WriteLine("Entered temperature is in Fahrenheit. In Celsium it will be: " + ((temperature - 32) / 1.8));
            else
                Console.WriteLine("Error! Enter right choise: 'f' or 'c'");

            Console.WriteLine("\n--------------\n");

            Console.WriteLine("Задание №7");

            int start, end, temp;

            Console.Write("Enter start of the range: ");
            enteringString = Console.ReadLine();
            start = Convert.ToInt32(enteringString);

            Console.Write("Enter end of the range: ");
            enteringString = Console.ReadLine();
            end = Convert.ToInt32(enteringString);

            if (start > end)
            {
                temp = start;
                start = end;
                end = temp;
                Console.WriteLine("Normalisation has been done.");
            }

            Console.Write("All even numbers:");

            for (int i = start; i <= end; i++)
            {
                if (i % 2 == 0)
                    Console.Write(i + " ");
            }

            Console.ReadLine();
        }
    }
}
