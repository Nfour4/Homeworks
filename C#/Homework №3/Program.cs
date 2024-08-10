using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace C__Homework__3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Задание №3.
            // Пользователь вводит строку с клавиатуры. Необходимо зашифровать данную строку используя шифр Цезаря.
            // Кроме механизма шифровки, реализуйте механизм расшифрования.

            // Шифрование
            Console.Write("Введите текст, который нужно зашифровать: ");
            string inputString = Console.ReadLine();
            string[] codeStrings = inputString.Split(new char[] { ' ' },
            StringSplitOptions.RemoveEmptyEntries);
            int[] indexes = new int[50];
            char[] answer = new char[100];

            Code(codeStrings, indexes, answer);

            Console.WriteLine();

            // Расшифровка
            Console.Write("Введите текст, который нужно расшифровать: ");
            inputString = Console.ReadLine();
            codeStrings = inputString.Split(new char[] { ' ' },
            StringSplitOptions.RemoveEmptyEntries);

            Decode(codeStrings, indexes, answer);

            //Console.WriteLine("\n-----------------------");

            // Задание №5.
            // Пользователь с клавиатуры вводит в строку арифметическое выражение. Приложение должно посчитать его результат.
            // Необходимо поддерживать только две операции: + и –.

            Console.Write("Введите строку: ");
            string inputString2 = Console.ReadLine();
            string[] numberStrings = inputString2.Split(new char[] { '+', '-' },
                StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[numberStrings.Length];

            for (int i = 0; i < numberStrings.Length; i++)
            {
                numbers[i] = Convert.ToInt32(numberStrings[i]);
            }

            if (inputString2[0] == '-')
            {
                numbers[0] = -numbers[0];
            }

            Sum(inputString2, numbers);

            Console.WriteLine("\n-----------------------");

            // Задание №6.
            //Пользователь с клавиатуры вводит некоторый текст.
            //Приложение должно изменять регистр первой буквы
            //каждого предложения на букву в верхнем регистре.

            Console.Write("Введите строку: ");
            string inputString3 = Console.ReadLine();
            string[] sentences = inputString3.Split(".".ToCharArray(),
                StringSplitOptions.RemoveEmptyEntries);

            string answerString = "";

            foreach (string sentence in sentences)
            {
                string sWithoutSpace = sentence.TrimStart();
                string sFirst = sWithoutSpace.Substring(0, 1).ToUpper();
                string sRest = sWithoutSpace.Substring(1); // от индекса 1 до конца 

                answerString += sFirst + sRest + ". ";
            }
            Console.WriteLine(answerString);

            Console.WriteLine("\n-----------------------");

            // Задание №7.
            //Создайте приложение, проверяющее текст на недопустимые слова. 
            //Если недопустимое слово найдено, оно должно быть заменено на набор символов *.
            //По итогам работы приложения необходимо показать статистику действий.

            Console.WriteLine("Введите текст:");
            string text = Console.ReadLine();
            string[] textArr = text.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            Console.Write("Введите слово, которое нужно запретить: ");
            string banWord = Console.ReadLine();

            int count = 0;

            for (int i = 0; i < textArr.Length; i++)
            {
                if (textArr[i].Contains(banWord))
                {
                    textArr[i] = textArr[i].Replace(banWord, new string('*', banWord.Length));
                    count++;
                }
            }

            text = String.Join(" ", textArr);

            Console.WriteLine("Очищенный текст: " + text);
            Console.WriteLine("Статастика: " + count + " замены слова \"" + banWord + "\"");

            Console.ReadKey();
        }
        static void Code(string[] codeStrings, int[] indexes, char[] answer)
        {
            int i = 0;
            Console.Write("Зашифрованный текст: ");
            foreach (string codeString in codeStrings)
            {
                foreach (char c in codeString)
                {
                    indexes[i] = (int)c;
                    if ((char)indexes[i] != '.'
                       && (char)indexes[i] != ','
                       && (char)indexes[i] != '!'
                       && (char)indexes[i] != '?') indexes[i] += 3;
                    i++;
                }
                for (int j = 0; j < i; j++)
                {
                    answer[j] = (char)indexes[j];
                    Console.Write(answer[j]);
                }
                Console.Write(" ");
                i = 0;
            }
        }
        static void Decode(string[] codeStrings, int[] indexes, char[] answer)
        {
            int i = 0;
            Console.Write("Расшифрованный текст: ");
            foreach (string codeString in codeStrings)
            {
                foreach (char c in codeString)
                {
                    indexes[i] = (int)c;
                    if ((char)indexes[i] != '.'
                       && (char)indexes[i] != ','
                       && (char)indexes[i] != '!'
                       && (char)indexes[i] != '?') indexes[i] -= 3;
                    i++;
                }
                for (int j = 0; j < i; j++)
                {
                    answer[j] = (char)indexes[j];
                    Console.Write(answer[j]);
                }
                Console.Write(" ");
                i = 0;
            }
        }
        static void Sum(string str, int[] num)
        {
            int sumAnswer = num[0];
            int j = 1;
            for (int i = 1; i < str.Length; i++)
            {
                char symbol = str[i];
                if (symbol == '+')
                {
                    sumAnswer += num[j];
                    j++;
                }
                else if (symbol == '-')
                {
                    sumAnswer -= num[j];
                    j++;
                }
            }
            Console.WriteLine();
            Console.Write("Ответ: " + sumAnswer);
        }
    }
}
