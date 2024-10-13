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
using System.Windows.Shapes;
using WPF_Lesson_8__quiz_.ViewModel;
using WPF_Lesson_8__quiz_.Model;

namespace WPF_Lesson_8__quiz_
{
    public partial class QuizSelection : Window
    {
        QuizListViewModel qlvm;
        public QuizSelection(User user)
        {
            qlvm = new QuizListViewModel(new DelegateCommand(StartQuizHandler), user);

            InitializeComponent();
            this.DataContext = qlvm;
        }
        public void StartQuizHandler(object obj)
        {
            var mainWindow = new MainWindow(qlvm.CurrentUser);
            mainWindow.Show();
            this.Close();
        }
    }
}
