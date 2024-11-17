using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Дополнение_к_WPF_SQL__Lesson_1.Models;

namespace Дополнение_к_WPF_SQL__Lesson_1.Repositories
{
    internal class EmployeeRepository
    {
        private readonly SqlConnection _connection;
        public EmployeeRepository(SqlConnection connection)
        {
            _connection = connection;
        }
        public List<Employee> getAll()
        {
            var list = new List<Employee>();
            string selectString = @"SELECT * FROM Employees";
            var cmd = new SqlCommand(selectString, _connection);

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Employee.FromString(
                            rdr[0].ToString(),
                            rdr[1].ToString(),
                            rdr[2].ToString())
                    );
                }
            }
            return list;
        }
        public List<Employee> GetMoreThan2()
        {
            var list = new List<Employee>();
            string selectString = @"GetMoreThan2";
            var cmd = new SqlCommand(selectString, _connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Employee.FromString(
                            rdr[0].ToString(),
                            rdr[1].ToString(),
                            rdr[2].ToString())
                    );
                }
            }
            return list;
        }
        public int InsertEmployee(Employee employee)
        {
            string insertString = $"INSERT INTO Employees (FirstName, LastName)"
               + $"VALUES (@FirstName, @LastName)";
            SqlCommand cmd = new SqlCommand(insertString, _connection);

            SqlParameter paramFirstName = new SqlParameter();
            paramFirstName.ParameterName = "@FirstName";
            paramFirstName.SqlDbType = System.Data.SqlDbType.NVarChar;
            paramFirstName.Value = employee.FirstName;
            cmd.Parameters.Add(paramFirstName);

            SqlParameter paramLastName = new SqlParameter("@LastName", System.Data.SqlDbType.NVarChar);
            paramLastName.Value = employee.LastName;
            cmd.Parameters.Add(paramLastName);

            return cmd.ExecuteNonQuery();
        }
        public int UpdateEmployee(int id,
                                  string firstName,
                                  string lastName)
        {
            string updateString = @"UPDATE Employees 
                                    SET FirstName = @FirstName,
                                        LastName = @LastName
                                    WHERE Id = @Id";
            SqlCommand cmd = new SqlCommand(updateString, _connection);

            cmd.Parameters.Add(new SqlParameter("@FirstName", System.Data.SqlDbType.NVarChar)).Value = firstName;
            cmd.Parameters.Add(new SqlParameter("@LastName", System.Data.SqlDbType.NVarChar)).Value = lastName;
            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
        public int DeleteEmployee(int id)
        {
            string deleteString = @"DELETE FROM Employees
                                    WHERE Id = @Id;
                                    DELETE FROM Sales
                                    WHERE EmployeeId = @Id";
            SqlCommand cmd = new SqlCommand(deleteString, _connection);

            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
    }
}
