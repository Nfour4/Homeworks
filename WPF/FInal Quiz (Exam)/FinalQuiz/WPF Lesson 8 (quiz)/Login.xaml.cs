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


namespace WPF_Lesson_8__quiz_
{
    public partial class Login : Window
    {
        LoginViewModel vm;
        public Login()
        {
            vm = new LoginViewModel(new DelegateCommand(LoginHandler));

            InitializeComponent();
            this.DataContext = vm;
        }
        public void LoginHandler(object obj)
        {
            if (vm.VerifyUser())
            {
                var quizSelectionWindow = new QuizSelection(vm.CurrentUser);
                quizSelectionWindow.Show();
                this.Close();
            }
            else
            {
                _ = MessageBox.Show("Incorrect Login or Password!");
            }
        }
    }
}
