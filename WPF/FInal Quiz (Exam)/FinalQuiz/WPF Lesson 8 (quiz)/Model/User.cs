using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPF_Lesson_8__quiz_.Model
{
    public class User
    {
        public string Login { get; set; }
        public string Password { get; set; }
        public User(string login, string password)
        {
            Login = login;
            Password = password;
        }

        public static List<User> GenerateUsers()
        {
            var users = new List<User>()
            {
                new User("User1", "123456"),
                new User("User2", "123456"),
                new User("User3", "123456")
            };
            return users;
        }
    }
}
