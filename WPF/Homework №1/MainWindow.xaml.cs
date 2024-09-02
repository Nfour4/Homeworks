using System;
using System.Collections.Generic;
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

namespace WPF_Homework__1
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            button.Click += numberGuess;
        }
        private void numberGuess(object sender, RoutedEventArgs e)
        {
            Random guess = new Random();
            MessageBoxResult result = MessageBox.Show($"Я думаю, вы задумали {guess.Next(0, 10)}." ,
                "My Title",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                text.Text = $"Я угадала ваше число!";
            }
            else
            {
                text.Text = $"Позвольте мне попробовать еще раз!";
            }
        }
    }
}
