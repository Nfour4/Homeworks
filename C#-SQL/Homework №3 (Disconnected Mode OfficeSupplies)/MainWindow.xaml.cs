using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Configuration;

namespace Homework__3__Disconnected_mode_WPF_
{
    public partial class MainWindow : Window
    {
        public DataSet DataSet { get; set; }
        public SqlDataAdapter EmployeesDataAdapter { get; set; }
        public SqlDataAdapter ProductsDataAdapter { get; set; }
        public SqlDataAdapter SalesDataAdapter { get; set; }
        public MainWindow()
        {
            InitializeComponent();

            DataSet = new DataSet();

            SqlConnection conn = null;
            string connectionString = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

            try
            {
                conn = new SqlConnection(connectionString);

                EmployeesDataAdapter = GetEmployeesAdapter(conn);
                ProductsDataAdapter = GetProductsAdapter(conn);
                SalesDataAdapter = GetSalesAdapter(conn);

                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            buttonFillEmployee.Click += ButtonFillEmployee_Click;
            buttonUpdateEmployee.Click += ButtonUpdateEmployee_Click;
            buttonDeleteEmployee.Click += ButtonDeleteEmployee_Click;

            buttonFillProduct.Click += ButtonFillProduct_Click;
            buttonUpdateProduct.Click += ButtonUpdateProduct_Click;
            buttonDeleteProduct.Click += ButtonDeleteProduct_Click;

            buttonFillSale.Click += ButtonFillSale_Click;
            buttonUpdateSale.Click += ButtonUpdateSale_Click;
            buttonDeleteSale.Click += ButtonDeleteSale_Click;
        }

        private void ButtonDeleteSale_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (gridSales.SelectedItems != null)
                {
                    for (int i = 0; i < gridSales.SelectedItems.Count; i++)
                    {
                        DataRow dataRow = (gridSales.SelectedItems[i] as DataRowView).Row;
                        if (dataRow != null)
                        {
                            dataRow.Delete();
                        }
                    }
                    SalesDataAdapter.Update(DataSet, "Sales");
                    UpdateGridDataSource();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonUpdateSale_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                SalesDataAdapter.Update(DataSet, "Sales");
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonFillSale_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonDeleteProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (gridProducts.SelectedItems != null)
                {
                    for (int i = 0; i < gridProducts.SelectedItems.Count; i++)
                    {
                        DataRow dataRow = (gridProducts.SelectedItems[i] as DataRowView).Row;
                        if (dataRow != null)
                        {
                            dataRow.Delete();
                        }
                    }
                    ProductsDataAdapter.Update(DataSet, "Products");
                    UpdateGridDataSource();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonUpdateProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ProductsDataAdapter.Update(DataSet, "Products");
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonFillProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonDeleteEmployee_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (gridEmployees.SelectedItems != null)
                {
                    for (int i = 0; i < gridEmployees.SelectedItems.Count; i++) 
                    {
                        DataRow dataRow = (gridEmployees.SelectedItems[i] as DataRowView).Row;
                        if (dataRow != null) 
                        {
                            dataRow.Delete();
                        }
                    }
                    EmployeesDataAdapter.Update(DataSet, "Employees");
                    UpdateGridDataSource();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonUpdateEmployee_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                EmployeesDataAdapter.Update(DataSet, "Employees");
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void ButtonFillEmployee_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                UpdateGridDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        public void UpdateGridDataSource()
        {
            DataSet.Clear();

            EmployeesDataAdapter.Fill(DataSet, "Employees");
            ProductsDataAdapter.Fill(DataSet, "Products");
            SalesDataAdapter.Fill(DataSet, "Sales");

            gridEmployees.ItemsSource = DataSet.Tables["Employees"].DefaultView;
            gridProducts.ItemsSource = DataSet.Tables["Products"].DefaultView;
            gridSales.ItemsSource = DataSet.Tables["Sales"].DefaultView;
        }
        public static SqlDataAdapter GetEmployeesAdapter(SqlConnection conn)
        {
            string selectCommand = @"SELECT * FROM Employees";

            SqlDataAdapter employeesAdapter = new SqlDataAdapter(selectCommand, conn);

            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(employeesAdapter);

            return employeesAdapter;
        }
        public static SqlDataAdapter GetProductsAdapter(SqlConnection conn)
        {
            string selectCommand = @"SELECT * FROM Products";

            SqlDataAdapter productsAdapter = new SqlDataAdapter(selectCommand, conn);

            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(productsAdapter);

            return productsAdapter;
        }
        public static SqlDataAdapter GetSalesAdapter(SqlConnection conn)
        {
            string selectCommand = @"SELECT * FROM Sales";

            SqlDataAdapter salesAdapter = new SqlDataAdapter(selectCommand, conn);

            SqlCommandBuilder sqlCommandBuilder = new SqlCommandBuilder(salesAdapter);

            return salesAdapter;
        }
    }
}
