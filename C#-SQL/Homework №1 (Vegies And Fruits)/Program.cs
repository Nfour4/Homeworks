using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace C__SQL_Homework__1__Vegies_and_Fruits_
{
    public class Program
    {
        static void Main(string[] args)
        {
            SqlConnection conn = null;
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["MyConnString"].ConnectionString;
                conn = new SqlConnection(ConnectionString);

                conn.Open();
                if (conn.State == ConnectionState.Open)
                    Console.WriteLine("Connected to Database");

                VFRepository vfRepo = new VFRepository(conn);

                // Задание 3.1 - отображение всей информации из таблицы с овощами и фруктами

                //var allVF = vfRepo.GetAll();

                //Console.WriteLine(allVF);

                // Задание 3.2 - отображение всех названий овощей и фруктов

                //var allTitles = vfRepo.GetAllTitles();

                //Console.WriteLine(allTitles);

                // Задание 3.3 - отображение всех цветов

                //var allColors = vfRepo.GetAllСolors();

                //Console.WriteLine(allColors);

                // Задание 3.4 - отображение максимальной калорийности

                //var maxCalories = vfRepo.GetMaxCalories();

                //Console.WriteLine(maxCalories); 

                // Задание 3.4 - отображение минимальной калорийности

                //var minCalories = vfRepo.GetMinCalories();

                //Console.WriteLine(minCalories);

                // Задание 3.4 - отображение минимальной калорийности

                //var avgCalories = vfRepo.GetAvgCalories();

                //Console.WriteLine(avgCalories);

                // Задание 4.1 - показать количество овощей;

                //var countVegies = vfRepo.GetVegiesCount();

                //Console.WriteLine(countVegies);

                // Задание 4.2 - показать количество фруктов;

                //var countFruits = vfRepo.GetFruitsCount();

                //Console.WriteLine(countFruits);

                // Задание 4.3 - Показать количество овощей и фруктов заданного цвета;

                //var countColor = vfRepo.GetByColor();

                //Console.WriteLine(countColor);

                // Задание 4.4 - Показать количество овощей и фруктов каждого цвета;

                //var countEachColor = vfRepo.GetEachColor();

                //Console.WriteLine(countEachColor);

                // Задание 4.5 - Показать овощи и фрукты с калорийностью ниже указанной;

                //var lessThan = vfRepo.GetCaloriesLess();

                //Console.WriteLine(lessThan);

                // Задание 4.6 - Показать овощи и фрукты с калорийностью выше указанной;

                //var moreThan = vfRepo.GetCaloriesMore();

                //Console.WriteLine(moreThan); 

                // Задание 4.7 - Показать овощи и фрукты с калорийностью в указанном диапазоне;

                //var range = vfRepo.GetCaloriesInRange();

                //Console.WriteLine(range);

                // Задание 4.8 - Показать все овощи и фрукты, у которых цвет желтый или красный;

                //var redYellow = vfRepo.GetRedOrYellow();

                //Console.WriteLine(redYellow);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }
    }
}
