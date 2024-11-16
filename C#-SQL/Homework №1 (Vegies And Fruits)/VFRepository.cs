using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__SQL_Homework__1__Vegies_and_Fruits_
{
    public class VFRepository
    {
        private readonly SqlConnection conn;

        public VFRepository(SqlConnection connection)
        {
            conn = connection;
        }

        public string GetAll()
        {
            string allVFData = "";

            string selectString = "SELECT * FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    allVFData += rdr.GetName(i) + "\t";
                }
                allVFData += "\n";

                while (rdr.Read())
                {
                    allVFData += rdr["Id"] + "\t" 
                        + rdr["Title"] + "\t" + rdr["Type"] 
                        + " \t" + rdr["Color"] + "\t" + rdr["Calories"] + "\n";
                }
            }
            return allVFData;
        }
        public string GetAllTitles()
        {
            string allVFData = "";

            string selectString = "SELECT Title FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "\t" + rdr.GetName(0);

                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += "\t" + rdr["Title"] + "\n";
                }
            }
            return allVFData;
        }
        public string GetAllСolors()
        {
            string allVFData = "";

            string selectString = "SELECT Color FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "\t" + rdr.GetName(0);

                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += "\t" + rdr["Color"] + "\n";
                }
            }
            return allVFData;
        }
        public string GetMaxCalories()
        {
            string allVFData = "";

            string selectString = "SELECT MAX(Calories) FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Max Calories: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }
            return allVFData;
        }
        public string GetMinCalories()
        {
            string allVFData = "";

            string selectString = "SELECT MIN(Calories) FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Min Calories: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }
            return allVFData;
        }
        public string GetAvgCalories()
        {
            string allVFData = "";

            string selectString = "SELECT AVG(Calories) FROM [Vegies&Fruits]";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Avg Calories: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }
            return allVFData;
        }
        public string GetVegiesCount()
        {
            string allVFData = "";

            string selectString = "SELECT COUNT(*) FROM [Vegies&Fruits] WHERE Type = 'Vegie'";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Vegies count: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }
            
            return allVFData;
        }
        public string GetFruitsCount()
        {
            string allVFData = "";

            string selectString = "SELECT COUNT(*) FROM [Vegies&Fruits] WHERE Type = 'Fruit'";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Fruits count: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }
            
            return allVFData;
        }
        public string GetByColor()
        {
            string allVFData = "";

            string selectString = "SELECT COUNT(*) FROM [Vegies&Fruits] WHERE Color = 'Red'";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += " " + "Red vegies and fruits count: ";

                if (rdr.Read())
                    allVFData += "\t" + rdr[0];
            }

            return allVFData;
        }
        
        public string GetEachColor()
        {
            string allVFData = "";

            string selectString = "SELECT Color, COUNT(*) FROM [Vegies&Fruits] GROUP BY Color;";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                
                allVFData += "Color" + "\t" + "Count";
                
                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += rdr[0] + "\t"
                        + rdr[1] + "\n";
                }
            }

            return allVFData;
        }
        public string GetCaloriesLess()
        {
            string allVFData = "";

            string selectString = "SELECT * FROM [Vegies&Fruits] WHERE Calories < (SELECT AVG(Calories) FROM [Vegies&Fruits]);";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "Id" + "\t" + "Title" + "\t" + "Calories";
                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += rdr["Id"] + "\t"
                        + rdr["Title"] + "    " + rdr["Calories"] + "\n";
                }
            }

            return allVFData;
        } 
        
        public string GetCaloriesMore()
        {
            string allVFData = "";

            string selectString = "SELECT * FROM [Vegies&Fruits] WHERE Calories > (SELECT AVG(Calories) FROM [Vegies&Fruits]);";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "Id" + "\t" + "Title" + "\t" + "Calories";
                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += rdr["Id"] + "\t"
                        + rdr["Title"] + "    " + rdr["Calories"] + "\n";
                }
            }

            return allVFData;
        }
        
        public string GetCaloriesInRange()
        {
            string allVFData = "";

            string selectString = "SELECT * FROM [Vegies&Fruits] WHERE Calories BETWEEN 40 AND 60";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "Id" + "\t" + "Title" + "\t" + "Calories";
                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += rdr["Id"] + "\t"
                        + rdr["Title"] + "    " + rdr["Calories"] + "\n";
                }
            }

            return allVFData;
        }
        public string GetRedOrYellow()
        {
            string allVFData = "";

            string selectString = "SELECT * FROM [Vegies&Fruits] WHERE Color IN ('Red', 'Yellow')";
            SqlCommand cmd = new SqlCommand(selectString, conn);

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                allVFData += "Id" + "\t" + "Title" + "\t" + "Color";
                allVFData += "\n\n";

                while (rdr.Read())
                {
                    allVFData += rdr["Id"] + "\t"
                        + rdr["Title"] + "    " + rdr["Color"] + "\n";
                }
            }

            return allVFData;
        }
    }
}
