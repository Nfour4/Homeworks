using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Дополнение_к_WPF_SQL__Lesson_1.Repositories;
using Дополнение_к_WPF_SQL__Lesson_1.Models;

namespace Дополнение_к_WPF_SQL__Lesson_1
{
    internal class Program
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


                ProductsRepository pr = new ProductsRepository(conn);
                EmployeeRepository er = new EmployeeRepository(conn);
                SalesRepository sr = new SalesRepository(conn);

                //*** Задание 1.1 - вставка новых канцтоваров ***

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Pen",
                //    ProductType = "Stationary",
                //    Cost = 50.00m,
                //    Price = 100.00m,
                //    Quantity = 100
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Notebook",
                //    ProductType = "Stationary",
                //    Cost = 150.00m,
                //    Price = 250.00m,
                //    Quantity = 500
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Pencil",
                //    ProductType = "Stationary",
                //    Cost = 100.00m,
                //    Price = 200.00m,
                //    Quantity = 400
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Ruler",
                //    ProductType = "Stationary",
                //    Cost = 170.00m,
                //    Price = 230.00m,
                //    Quantity = 200
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Folder",
                //    ProductType = "Stationary",
                //    Cost = 270.00m,
                //    Price = 320.00m,
                //    Quantity = 240
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Glue",
                //    ProductType = "Stationary",
                //    Cost = 120.00m,
                //    Price = 250.00m,
                //    Quantity = 210
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Envelope",
                //    ProductType = "Stationary",
                //    Cost = 110.00m,
                //    Price = 220.00m,
                //    Quantity = 120
                //});

                // pr.InsertProduct(new Product()
                //{
                //    ProductName = "Eraser",
                //    ProductType = "Stationary",
                //    Cost = 120.00m,
                //    Price = 200.00m,
                //    Quantity = 160
                //}); 

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Highlighter",
                //    ProductType = "Stationary",
                //    Cost = 180.00m,
                //    Price = 270.00m,
                //    Quantity = 360
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Rubber stamp",
                //    ProductType = "Stationary",
                //    Cost = 280.00m,
                //    Price = 570.00m,
                //    Quantity = 520
                //});

                //pr.InsertProduct(new Product()
                //{
                //    ProductName = "Scissors",
                //    ProductType = "Stationary",
                //    Cost = 380.00m,
                //    Price = 420.00m,
                //    Quantity = 350
                //});

                //*** Задание 1.2 - вставка новых типов канцтоваров ***

                //pr.InsertType("Bakery");

                //*** Задание 1.3 - вставка новых менеджеров по продажам ***

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Jim",
                //    LastName = "Beam"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Jack",
                //    LastName = "Black"
                //}); 

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Joe",
                //    LastName = "Jones"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Barry",
                //    LastName = "Allen"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Nick",
                //    LastName = "Means"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "David",
                //    LastName = "Beackham"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Nickolay",
                //    LastName = "Nickulin"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Travis",
                //    LastName = "Carrot"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Ben",
                //    LastName = "Ten"
                //});

                //er.InsertEmployee(new Employee()
                //{
                //    FirstName = "Sam",
                //    LastName = "Laccy"
                //});

                //*** Задание 1.4 - вставка новых фирм покупателей (я сделал - вставка новых покупок) ***

                //sr.InsertSale(new Sale() {
                //    SProduct = new Product() { Id = 2 },
                //    SEmployee = new Employee() { Id = 3},
                //    CustomerName = "Jim Dillason",
                //    Quantity = 2 }
                //);

                // *** Задание 2.1 - обновление информации о существующих канцтоварах ***

                //pr.UpdateProduct(1, "Box", "Package", 20.00m, 100.00m, 100);

                // *** Задание 2.2 - Обновление информации о существующих фирмах покупателях; (я сделал - обновление информации о покупке) ***

                //sr.UpdateSale(1, 6, 7, "Lucky Luck", 50);

                // *** Задание 2.3 - Обновление информации о существующих менеджерах по продажам; ***

                //er.UpdateEmployee(1, "Kim", "Jim");

                // *** Задание 2.4 - Обновление информации о существующих типах канцтоваров; ***

                //pr.UpdateProductType(3, "Bakery");

                // *** Задание 3.1 - Удаление канцтоваров; ***

                //pr.DeleteProduct(3);

                // *** Задание 3.2 - Удаление менеджеров по продажам; ***

                //er.DeleteEmployee(10);

                // *** Задание 3.3 - Удаление типов канцтоваров; *** - сделал с помощью UPDATE, по-другому не знаю как. значение NULL не присваиваю, так как если присваиваю - не выводит на экран данные, ошибку выдает. 

                //pr.DeleteType("Package");

                // *** Задание 4.1 - Показать информацию о менеджере с наибольшим количеством продаж по количеству единиц; ***
                // - сделал для всех, у кого кол-во продаж больше 2-х. НЕ ПОНИМАЮ, как с помощью этих подзапросов вычислить именно максимальное кол-во продаж
                //как совмещать COUNT и MAX в подзапросах??? уже сколько мучаюсь, так и не могу понять. 

                //List<Employee> le = er.GetMoreThan2();

                //foreach (Employee e in le)
                //{
                //    Console.WriteLine(e);
                //}

                // *** Задание 4.4 - Показать информацию о фирме покупателе, которая купила на самую большую сумму; ; ***

                //List<Sale> ls = sr.MaxSummBuy();

                //foreach (Sale s in ls)
                //{
                //    Console.WriteLine(s);
                //}

                // ***  Задание 4.5 - Показать информацию о типе канцтоваров с наибольшим количеством продаж по единицам; ***

                //List<Product> lp = pr.MaxQuantitySold();

                //foreach (Product p in lp)
                //{
                //    Console.WriteLine(p);
                //}

                // ***  Задание 4.6 - Показать информацию о типе самых прибыльных канцтоваров; *** - не знаю, так - не так, сделал как получилось

                //List<Product> lp = pr.MaxProfitProduct();

                //foreach (Product p in lp)
                //{
                //    Console.WriteLine(p);
                //}

                //List<Sale> ls = sr.getAll();

                //foreach (Sale s in ls)
                //{
                //    Console.WriteLine(s);
                //}

                //List<Employee> le = er.getAll();

                //foreach (Employee e in le)
                //{
                //    Console.WriteLine(e);
                //}

                //List<Product> lp = pr.getAll();

                //foreach (Product p in lp)
                //{
                //    Console.WriteLine(p);
                //}

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
