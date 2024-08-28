using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace C__Homework__9
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int choice;

            Word[] russianWords =
            {
                new Word("Энциклопедия",
                        new string[] { "Encyclopedia", "Cyclopaedia" }),
                new Word("Азбука",
                        new string[] { "The ABC", "Alphabet"}),
                new Word("Интуиция",
                        new string[] { "Intuition" }),
                new Word("Змея", new string[] { "Snake" }),
                new Word("Родина", new string[] { "Homeland" }),
                new Word("Река", new string[] { "River" })
            };

            Word[] englishWords =
            {
                new Word("Dog", new string[] { "Собака" }),
                new Word("Kitchen", new string[] { "Кухня" }),
                new Word("Table", new string[] { "Стол" }),
                new Word("Rabbit", new string[] { "Кролик" }),
                new Word("Jump", new string[] { "Прыгать", "Прыжок" }),
                new Word("Spider", new string[] { "Паук" })
            };

            Dect rusEngDictionary = new Dect(russianWords, russianWords.Length);
            Dect engRusDictionary = new Dect(englishWords, englishWords.Length);

            do
            {
                Console.WriteLine("Выберите словарь:");
                Console.WriteLine("1. Русско-английский словарь.");
                Console.WriteLine("2. Англо-русский словарь.");
                Console.WriteLine("0. Выход");

                Console.Write("\nВаш выбор: ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.Clear();
                        Console.WriteLine("     Русско-английский словарь:");
                        rusEngDictionary.SortAndPrint();
                        Console.WriteLine();

                        DictionaryMenu(rusEngDictionary);

                        break;
                    case 2:
                        Console.Clear();
                        Console.WriteLine("     Англо-русский словарь:");
                        engRusDictionary.SortAndPrint();
                        Console.WriteLine();

                        DictionaryMenu(engRusDictionary);

                        break;
                }
            } while (choice != 0);

            Console.WriteLine("\nВсего доброго!\n");
        }
        static Dect DictionaryMenu(Dect dictionary)
        {
            int choice = 1;

            do
            {
                Console.WriteLine("Меню: ");
                Console.WriteLine("1. Добавить слово в словарь.");
                Console.WriteLine("2. Заменить слово или перевод.");
                Console.WriteLine("3. Удалить слово или перевод.");
                Console.WriteLine("4. Искать перевод слова.");
                Console.WriteLine("0. Выход.");

                Console.Write("\nВаш выбор: ");
                choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        dictionary = Add(dictionary);
                    break;
                    case 2:
                        dictionary = Change(dictionary);      
                    break;
                    case 3:
                        dictionary = Delete(dictionary);
                    break;
                    case 4:
                        Find(dictionary);
                    break;
                }
            } while (choice != 0);
            Console.Clear();

            return dictionary;
        }
        static Dect Add(Dect dictionary)
        {
            Word newWord = new Word();

            AddWord(newWord);
            dictionary = dictionary + newWord;

            Console.Clear();
            Console.WriteLine("Слово было добавлено в словарь: ");
            dictionary.SortAndPrint();

            return dictionary;
        }
        static Dect Change(Dect dictionary)
        {
            int choice = 1;
            string word, decs;
            bool gotIt = false;
     
            do
            {
                gotIt = false;

                Console.WriteLine("\nМеню: ");
                Console.WriteLine("1. Заменить слово.");
                Console.WriteLine("2. Заменить перевод.");
                Console.WriteLine("0. Назад.");

                Console.Write("\nВаш выбор: ");
                choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        try
                        {
                            Console.Write("\nВведите слово: ");
                            word = Console.ReadLine();

                            foreach (Word w in dictionary.words)
                            {
                                if (w.OriginalWord.Equals(word))
                                {
                                    gotIt = true;

                                    Console.WriteLine($"\nДалее, введите слово, на которое хотите поменять данное:");
                                    AddWord(w);

                                    Console.Clear();
                                    Console.WriteLine($"Слово \"{word}\" было заменено на \"{w.OriginalWord}\"." +
                                        $"\nНовый словарь: ");
                                    dictionary.SortAndPrint();
                                    break;
                                }
                            }
                            if (!gotIt) throw new Exception("Такого слова нет в словаре. Введите заново.");
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"\nОшибка: {ex.Message}\n");
                        }

                    break;
                    case 2:
                        try
                        {
                            Console.Write("Введите перевод: ");
                            word = Console.ReadLine();

                            foreach (Word w in dictionary.words)
                            {
                                for (int i = 0; i < w.TranslatedWords.Length; i++)
                                {
                                    if (w.TranslatedWords[i].Equals(word))
                                    {
                                        gotIt = true;
                                        Console.Write($"\nЭто слово (\"{w.OriginalWord}\") содержит нужный перевод ({word}).\n" +
                                            $"Введите перевод, на который хотите поменять данный\n(если замена не нужна, введите 0): ");
                                        
                                        decs = Console.ReadLine();

                                        if (decs != "0")
                                        {
                                            w.TranslatedWords[i] = decs;
                                            Console.WriteLine($"Перевод слова \"{w.OriginalWord}\" ({word}) был заменен на \"{w.TranslatedWords[i]}\".");
                                        }
                                        else
                                        {
                                            continue;
                                        }
                                    }  
                                }
                            }
                            if (!gotIt)
                            {
                                throw new Exception("Такого перевода нет в словаре. Введите заново.");
                            } 
                            else
                            {
                                Console.Clear();
                                Console.WriteLine($"Все выбранные переводы были заменены.\nНовый словарь:");
                                dictionary.SortAndPrint();
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"\nОшибка: {ex.Message}");
                        }
                        break;
                }
            } while (choice != 0);

            Console.Clear();
            dictionary.SortAndPrint();

            return dictionary;
        }
        static Dect Delete(Dect dictionary)
        {
            int choice = 1;
            bool gotIt = false;
            do
            {
                gotIt = false;

                Console.WriteLine("\nМеню: ");
                Console.WriteLine("1. Удалить слово.");
                Console.WriteLine("2. Удалить перевод.");
                Console.WriteLine("0. Назад.");

                Console.Write("\nВаш выбор: ");
                choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        try
                        {
                            Console.Write("\nВведите слово, которое хотите удалить: ");
                            string deletedWord = Console.ReadLine();

                            foreach (Word w in dictionary.words)
                            {
                                if (w.OriginalWord.Equals(deletedWord))
                                {
                                    gotIt = true;
                                    break;
                                }
                            }

                            var dArr = dictionary.words.Where(l => l.OriginalWord != deletedWord);
                            dictionary.words = dArr.ToArray();
                            
                            if (gotIt)
                            {
                                dictionary.dectSize--;
                                Console.Clear();
                                Console.WriteLine($"Слово \"{deletedWord}\" было удалено.\nНовый словарь:");
                                dictionary.SortAndPrint();
                            }
                            else
                            {
                                throw new Exception("Такого слова нет в словаре. Введите заново.");
                            }         
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Ошибка: {ex.Message}");
                        }
                        break;
                    case 2:

                        Console.Write("\nВведите перевод, которое хотите удалить: ");
                        string deletedDesc = Console.ReadLine();

                        try
                        {
                            for (int i = 0; i < dictionary.words.Length; i++)
                            {
                                if (dictionary.words[i].TranslatedWords.Length == 1
                                    && dictionary.words[i].TranslatedWords.Contains(deletedDesc))
                                {
                                    gotIt = true;
                                    Console.WriteLine($"\nУ слова {dictionary.words[i].OriginalWord} только 1 перевод. Его удалить нельзя. (нажмите для продолжения)");
                                    Console.ReadKey();
                                    continue;
                                }
                                if (dictionary.words[i].TranslatedWords.Length != 1 && dictionary.words[i].TranslatedWords.Contains(deletedDesc))
                                {
                                    gotIt = true;
                                    Console.Write($"\nПеревод \"{deletedDesc}\" есть у слова \"{dictionary.words[i].OriginalWord}\".\n" +
                                        $"Его нужно удалить?(1 - да, 0 - нет): ");
                                    int check = Convert.ToInt32(Console.ReadLine());
                                    if (check == 1)
                                    {
                                        var newDesc = dictionary.words[i].TranslatedWords.Where(l => l != deletedDesc);
                                        dictionary.words[i].TranslatedWords = newDesc.ToArray();
                                    }
                                    else if (check == 0)
                                    {
                                        continue;
                                    }
                                }
                            }
                            if (gotIt)
                            {
                                Console.Clear();
                                Console.WriteLine($"Перевод \"{deletedDesc}\" был удален во всех запрашиваемых случаях.\nНовый словарь:");
                                dictionary.SortAndPrint();
                            }
                            else
                            {
                                throw new Exception("Такого перевода нет в словаре. Введите заново.");
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"\nОшибка: {ex.Message}");
                        }
                        break;
                }
            } while (choice != 0);

            Console.Clear();
            dictionary.SortAndPrint();

            return dictionary;
        }
        static void Find(Dect dictionary)
        {
            try
            {
                Console.Write("\nВведите перевод, который хотите найти: ");
                string findDesc = Console.ReadLine();

                var foundDesc = dictionary.words.Where(w => w.TranslatedWords.Contains(findDesc));

                if (foundDesc.Any()) 
                { 
                    Console.Clear();
                    dictionary.SortAndPrint();
                    Console.WriteLine();
                    foreach (var v in foundDesc)
                    {
                        Console.WriteLine($"У слова \"{v.OriginalWord}\" есть перевод ({findDesc}), который вы ищете.\n");
                    }
                }
                else
                {
                    throw new Exception("Данного перевода нет ни у одного слова.\n");
                }
            }
            catch(Exception ex)
            {
                Console.Clear();
                dictionary.SortAndPrint();
                Console.WriteLine($"\nОшибка: {ex.Message}");
            }
            
        }
        static void AddWord(Word w)
        {
            Console.Write("\nСлово: ");
            string origWord = Console.ReadLine();

            Console.Write("\nСколько переводов у слова?: ");
            int transCount = Convert.ToInt32(Console.ReadLine());
            string[] transWords = new string[transCount];

            for (int i = 0; i < transCount; i++)
            {
                Console.Write($"Перевод {i + 1}: ");
                transWords[i] = Console.ReadLine();
            }
            Console.WriteLine();

            w.OriginalWord = origWord;
            w.TranslatedWords = transWords;
        }
    }
}
