using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Дополнение_к_WPF_SQL__Lesson_1.Models;

namespace Дополнение_к_WPF_SQL__Lesson_1.Repositories
{
    internal class SalesRepository
    {
        private readonly SqlConnection _connection;
        public SalesRepository(SqlConnection connection)
        {
            _connection = connection;
        }
        public List<Sale> getAll()
        {
            var list = new List<Sale>();
            string selectString = @"GetSales";
            var cmd = new SqlCommand(selectString, _connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Sale.FromString(rdr)
                    );
                }
            }
            return list;
        }
        public int InsertSale(Sale sale)
        {
            string insertString = $"INSERT INTO Sales (ProductId, EmployeeId, CustomerName, Quantity)"
               + $"VALUES (@ProductId, @EmployeeId, @CustomerName, @Quantity)";
            SqlCommand cmd = new SqlCommand(insertString, _connection);

            SqlParameter paramProductId = new SqlParameter("@ProductId", System.Data.SqlDbType.Int);
            paramProductId.Value = sale.SProduct.Id;
            cmd.Parameters.Add(paramProductId);
            
            SqlParameter paramEmployeeId = new SqlParameter("@EmployeeId", System.Data.SqlDbType.Int);
            paramEmployeeId.Value = sale.SEmployee.Id;
            cmd.Parameters.Add(paramEmployeeId);
            
            SqlParameter paramCustomerName = new SqlParameter("@CustomerName", System.Data.SqlDbType.NVarChar);
            paramCustomerName.Value = sale.CustomerName;
            cmd.Parameters.Add(paramCustomerName);
            
            SqlParameter paramQuantity = new SqlParameter("@Quantity", System.Data.SqlDbType.NVarChar);
            paramQuantity.Value = sale.Quantity;
            cmd.Parameters.Add(paramQuantity);

            return cmd.ExecuteNonQuery();
        }
        public int UpdateSale(int id,
                              int productId,
                              int employeeId,
                              string customerName,
                              int quantity)
        {
            string updateString = @"UPDATE Sales 
                                    SET ProductId = @ProductId,
                                        EmployeeId = @EmployeeId,
                                        CustomerName = @CustomerName,
                                        Quantity = @Quantity
                                    WHERE Id = @Id";
            SqlCommand cmd = new SqlCommand(updateString, _connection);

            cmd.Parameters.Add(new SqlParameter("@ProductId", System.Data.SqlDbType.Int)).Value = productId;
            cmd.Parameters.Add(new SqlParameter("@EmployeeId", System.Data.SqlDbType.Int)).Value = employeeId;
            cmd.Parameters.Add(new SqlParameter("@CustomerName", System.Data.SqlDbType.NVarChar)).Value = customerName;
            cmd.Parameters.Add(new SqlParameter("@Quantity", System.Data.SqlDbType.Int)).Value = quantity;
            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
        public List<Sale> MaxSummBuy()
        {
            var list = new List<Sale>();
            string selectString = @"MaxSummBuy";
            var cmd = new SqlCommand(selectString, _connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Sale.FromString(rdr)
                    );
                }
            }
            return list;
        }
    }
}
