using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Дополнение_к_WPF_SQL__Lesson_1.Models;

namespace Дополнение_к_WPF_SQL__Lesson_1.Repositories
{
    internal class ProductsRepository
    {
        private readonly SqlConnection _connection;
        public ProductsRepository(SqlConnection connection)
        {
            _connection = connection;
        }
        public List<Product> getAll()
        {
            var list = new List<Product>();
            string selectString = @"SELECT * FROM Products";
            var cmd = new SqlCommand(selectString, _connection);

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Product.FromString(
                            rdr[0].ToString(), 
                            rdr[1].ToString(), 
                            rdr[2].ToString(), 
                            rdr[3].ToString(), 
                            rdr[4].ToString(), 
                            rdr[5].ToString())
                    );
                }
            }
            return list;
        }
        public int InsertProduct(Product product)
        {
            string insertString = $"INSERT INTO Products (ProductName, ProductType, Cost, Price, Quantity)"
               + $"VALUES (@ProductName, @ProductType, @Cost, @Price, @Quantity)";
            SqlCommand cmd = new SqlCommand(insertString, _connection);

            SqlParameter paramProductName = new SqlParameter("@ProductName", System.Data.SqlDbType.NVarChar);
            paramProductName.Value = product.ProductName;
            cmd.Parameters.Add(paramProductName);
            
            SqlParameter paramProductType = new SqlParameter("@ProductType", System.Data.SqlDbType.NVarChar);
            paramProductType.Value = product.ProductType;
            cmd.Parameters.Add(paramProductType);
            
            SqlParameter paramCost = new SqlParameter("@Cost", System.Data.SqlDbType.Decimal);
            paramCost.Value = product.Cost;
            cmd.Parameters.Add(paramCost);
            
            SqlParameter paramPrice = new SqlParameter("@Price", System.Data.SqlDbType.Decimal);
            paramPrice.Value = product.Price;
            cmd.Parameters.Add(paramPrice);
            
            SqlParameter paramQuantity = new SqlParameter("@Quantity", System.Data.SqlDbType.Int);
            paramQuantity.Value = product.Quantity;
            cmd.Parameters.Add(paramQuantity);

            return cmd.ExecuteNonQuery();
        }
        public int InsertType(string type)
        {
            string insertString = $"INSERT INTO Products (ProductType)"
              + $"VALUES (@ProductType)";
            SqlCommand cmd = new SqlCommand(insertString, _connection);

            SqlParameter paramProductType = new SqlParameter("@ProductType", System.Data.SqlDbType.NVarChar);
            paramProductType.Value = type;
            cmd.Parameters.Add(paramProductType);

            return cmd.ExecuteNonQuery();
        }
        public int UpdateProduct(int id,
                                 string productName, 
                                 string productType, 
                                 decimal cost,
                                 decimal price,
                                 int quantity)
        {
            string updateString = @"UPDATE Products 
                                    SET ProductName = @ProductName,
                                        ProductType = @ProductType,
                                        Cost = @Cost,
                                        Price = @Price,
                                        Quantity = @Quantity
                                    WHERE Id = @Id";
            SqlCommand cmd = new SqlCommand(updateString, _connection);

            cmd.Parameters.Add(new SqlParameter("@ProductName", System.Data.SqlDbType.NVarChar)).Value = productName;
            cmd.Parameters.Add(new SqlParameter("@ProductType", System.Data.SqlDbType.NVarChar)).Value = productType;
            cmd.Parameters.Add(new SqlParameter("@Cost", System.Data.SqlDbType.Decimal)).Value = cost;
            cmd.Parameters.Add(new SqlParameter("@Price", System.Data.SqlDbType.Decimal)).Value = price;
            cmd.Parameters.Add(new SqlParameter("@Quantity", System.Data.SqlDbType.Int)).Value = quantity;
            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
        
        public int UpdateProductType(int id,
                                     string productType)
        {
            string updateString = @"UPDATE Products 
                                    SET ProductType = @ProductType
                                    WHERE Id = @Id";
            SqlCommand cmd = new SqlCommand(updateString, _connection);

            cmd.Parameters.Add(new SqlParameter("@ProductType", System.Data.SqlDbType.NVarChar)).Value = productType;
            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
        public int DeleteProduct(int id)
        {
            string deleteString = @"DELETE FROM Products
                                    WHERE Id = @Id;
                                    DELETE FROM Sales
                                    WHERE ProductId = @Id";
            SqlCommand cmd = new SqlCommand(deleteString, _connection);

            cmd.Parameters.Add(new SqlParameter("@Id", System.Data.SqlDbType.Int)).Value = id;

            return cmd.ExecuteNonQuery();
        }
        public int DeleteType(string type)
        {
            string deleteString = @"UPDATE Products 
                                    SET ProductType = 'DELETED'
                                    WHERE ProductType = @ProductType";
            SqlCommand cmd = new SqlCommand(deleteString, _connection);

            cmd.Parameters.Add(new SqlParameter("@ProductType", System.Data.SqlDbType.NVarChar)).Value = type;

            return cmd.ExecuteNonQuery();
        }
        public List<Product> MaxQuantitySold()
        {
            var list = new List<Product>();
            string selectString = @"MaxQuantitySold";
            var cmd = new SqlCommand(selectString, _connection);

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Product.FromString(
                            rdr[0].ToString(),
                            rdr[1].ToString(),
                            rdr[2].ToString(),
                            rdr[3].ToString(),
                            rdr[4].ToString(),
                            rdr[5].ToString())
                    );
                }
            }
            return list;
        }
        public List<Product> MaxProfitProduct()
        {
            var list = new List<Product>();
            string selectString = @"MaxQuantitySold";
            var cmd = new SqlCommand(selectString, _connection);

            using (var rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    list.Add(
                        Product.FromString(
                            rdr[0].ToString(),
                            rdr[1].ToString(),
                            rdr[2].ToString(),
                            rdr[3].ToString(),
                            rdr[4].ToString(),
                            rdr[5].ToString())
                    );
                }
            }
            return list;
        }
    }
}
