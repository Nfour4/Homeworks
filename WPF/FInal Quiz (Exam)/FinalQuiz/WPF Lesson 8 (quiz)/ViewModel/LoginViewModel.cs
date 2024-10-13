using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WPF_Lesson_8__quiz_.Model;

namespace WPF_Lesson_8__quiz_.ViewModel
{
    public class LoginViewModel : INotifyPropertyChanged
    {
        public List<User> Users { get; set; }
        private User _currentUser;
        public User CurrentUser
        {
            get { return _currentUser; }
            set
            {
                _currentUser = value;
                OnPropertyChanged("CurrentUser");
            }
        }

        public ICommand LoginCommand { get; set; }
        public LoginViewModel(DelegateCommand command)
        {
            Users = User.GenerateUsers();
            CurrentUser = new User("", "");
            LoginCommand = command;
        }

        public bool VerifyUser()
        {
            foreach (var user in Users)
            {
                if (user.Login == CurrentUser.Login &&
                    user.Password == CurrentUser.Password) return true;
            }
            return false;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
