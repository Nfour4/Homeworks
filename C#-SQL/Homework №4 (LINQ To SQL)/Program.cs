using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Linq;

namespace Homework__4__LINQ_To_SQL_
{
    public class Program
    { 
        static void Main(string[] args)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
            CountriesDataContext db = new CountriesDataContext(connectionString);

            //DisplayAllCountries(db);
            //DisplayAllCountriesNames(db);
            //DisplayAllCapitals(db);
            //DisplayAllEuropeanCountries(db);
            //DisplayAreaMoreThanNumber(db);
            //DisplayAAndU(db);
            //DisplayStartsWithU(db);
            //DisplayAreaInRange(db);
            //DisplayPopulationMoreThanNumber(db);
            //DisplayTop5Area(db);
            //DisplayTop5Population(db);
            //DisplayTopArea(db);
            //DisplayTopPopulation(db);
            //DisplayMinAreaInAsia(db);
            //DisplayAverageAreaInAsia(db);

            Console.ReadLine();
        }

        //2.1 - Отобразить всю информацию о странах
        public static void DisplayAllCountries(CountriesDataContext db)
        {
            var countries = db.Countries;
            foreach (var country in countries)
            {
                Console.WriteLine(country);
            }
        }
        //2.2 - Отобразить названия стран
        public static void DisplayAllCountriesNames(CountriesDataContext db)
        {
            var countriesNames = db.Countries.Select(c=>c.CountryName);
            foreach (var name in countriesNames)
            {
                Console.WriteLine(name);
            }
        }
        //2.3 - Отобразить названия столиц
        public static void DisplayAllCapitals(CountriesDataContext db)
        {
            var capitals = db.Countries.Select(c => c.CapitalName);
            foreach (var capital in capitals)
            {
                Console.WriteLine(capital);
            }
        }
        //2.4 - Отобразить названия всех европейских стран
        public static void DisplayAllEuropeanCountries(CountriesDataContext db)
        {
            var europeanCountries = db.Countries.Where(c => c.Continent == "Europe");
            foreach (var country in europeanCountries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, it's in {country.Continent}");
            }
        }
        //2.5 - Отобразить названия всех европейских стран
        public static void DisplayAreaMoreThanNumber(CountriesDataContext db)
        {
            Console.Write("Введите число: ");
            var number = Convert.ToDecimal(Console.ReadLine());

            Console.WriteLine();

            var europeanCountries = db.Countries.Where(c => c.Area > number);
            foreach (var country in europeanCountries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, it has Area more than {number}: {country.Area}");
            }
        }
        //3.1 - Отобразить все страны, у которых в названии есть буквы a, u
        public static void DisplayAAndU(CountriesDataContext db)
        {
            var countries = db.Countries
                .Where(c => c.CountryName.Contains("a") && c.CountryName.Contains("u"));

            Console.WriteLine("Countries, that have 'a' and 'u' in their names:");
            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}");
            }
        }
        //3.2 - Отобразить все страны, у которых название начинается с буквы 'u'
        public static void DisplayStartsWithU(CountriesDataContext db)
        {
            var countries = db.Countries
                .Where(c => c.CountryName.StartsWith("u"));

            Console.WriteLine("Countries, whose names begin with 'u': ");
            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}");
            }
        }
        //3.3 - Отобразить все страны, у которых площадь находится в указанном диапазоне
        public static void DisplayAreaInRange(CountriesDataContext db)
        {
            Console.Write("Введите начало диапазона: ");
            var min = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Введите конец диапазона: ");
            var max = Convert.ToDecimal(Console.ReadLine());

            Console.WriteLine();

            var countries = db.Countries
                .Where(c => c.Area > min && c.Area < max);

            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, Area: {country.Area}");
            }
        }
        //3.4 - Отобразить страны, у которых кол-во жителей больше указанного числа
        public static void DisplayPopulationMoreThanNumber(CountriesDataContext db)
        {
            Console.Write("Введите число: ");
            var number = Convert.ToDecimal(Console.ReadLine());

            Console.WriteLine();

            var countries = db.Countries.Where(c => c.Population > number);
            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, it has Population more than {number}: {country.Area}");
            }
        }
        //4.1 - Показать топ-5 стран по площади
        public static void DisplayTop5Area(CountriesDataContext db)
        {
            var countries = (from c in db.Countries
                            orderby c.Area descending
                            select c).Take(5);

            Console.WriteLine("Top-5 Area:\n");
            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, Area: {country.Area}");
            }
        }
        //4.2 - Показать топ-5 стран по кол-ву жителей
        public static void DisplayTop5Population(CountriesDataContext db)
        {
            var countries = (from c in db.Countries
                            orderby c.Population descending
                            select c).Take(5);

            Console.WriteLine("Top-5 Population:\n");
            foreach (var country in countries)
            {
                Console.WriteLine($"Country Name: {country.CountryName}, Population: {country.Population}");
            }
        }
        //4.3 - Показать страну с самой большой площадью
        public static void DisplayTopArea(CountriesDataContext db)
        {
            var country = (from c in db.Countries
                            orderby c.Area descending
                            select c).FirstOrDefault();

            Console.WriteLine("Top-1 Area:\n");
            
            Console.WriteLine($"Country Name: {country.CountryName}, Area: {country.Area}");
        }
        //4.4 - Показать страну с самым большим кол-вом жителей
        public static void DisplayTopPopulation(CountriesDataContext db)
        {
            var country = (from c in db.Countries
                            orderby c.Population descending
                            select c).FirstOrDefault();

            Console.WriteLine("Top-1 Population:\n");
            
            Console.WriteLine($"Country Name: {country.CountryName}, Population: {country.Population}");
        }
        //4.5 - Показать страну с самой маленькой площадью в Азии
        public static void DisplayMinAreaInAsia(CountriesDataContext db)
        {
            var country = (from c in db.Countries
                           orderby c.Population ascending
                           where c.Continent == "Asia"
                           select c).FirstOrDefault();

            Console.WriteLine("Minimal Area in Asia:\n");
            
            Console.WriteLine($"Country Name: {country.CountryName}, Area: {country.Area}");
        }
        //4.6 - Показать среднюю площадь стран в Азии
        public static void DisplayAverageAreaInAsia(CountriesDataContext db)
        {
            var average = (from c in db.Countries
                           where c.Continent == "Asia"
                           select c.Area).Average();

            Console.WriteLine($"Average Area in Asia: {average}");
        }
    }
}
