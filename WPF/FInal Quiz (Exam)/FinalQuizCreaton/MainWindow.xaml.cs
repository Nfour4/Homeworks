using System;
using System.Collections.Generic;
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
using Homework__8__quiz_creation_.Model;
using Homework__8__quiz_creation_.ViewModel;

namespace Homework__8__quiz_creation_
{
    public partial class MainWindow : Window
    {
        QuizViewModel vm;
        public MainWindow()
        {
            InitializeComponent();
            vm = new QuizViewModel(this);
            this.DataContext = vm;

            comboBox.SelectionChanged += ComboBox_SelectionChanged;
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            vm.SetCorrectAnswer(comboBox.SelectedIndex);
        }
    }
}
