using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using WPF_Lesson_8__quiz_.Model;

namespace WPF_Lesson_8__quiz_.ViewModel
{
    public class QuizFile
    {
        public string FileName { get; set; }
        public string Topic { get; set; } // о чем идет речь в квизе

        public static List<QuizFile> GenerateQuizFiles()
        {
            var quizFiles = new List<QuizFile>()
            {
                new QuizFile() { FileName = "C:\\Users\\morev\\Desktop\\FinalQuizCreaton\\bin\\Debug\\HistoryQuiz.xml", Topic = "History Quiz" },
                new QuizFile() { FileName = "C:\\Users\\morev\\Desktop\\FinalQuizCreaton\\bin\\Debug\\GeographicQuiz.xml", Topic = "Geographic Quiz" },
                new QuizFile() { FileName = "C:\\Users\\morev\\Desktop\\FinalQuizCreaton\\bin\\Debug\\GrammaticalQuiz.xml", Topic = "Grammatical Quiz" }
            };
            return quizFiles;
        }
    }
    public class QuizListViewModel : INotifyPropertyChanged
    {
        List<QuizFile> QuizFiles { get; set; }
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
        public ICommand StartQuizCommand { get; set; }

        public QuizListViewModel(DelegateCommand command, User currentUser)
        {
            QuizFiles = QuizFile.GenerateQuizFiles();

            CurrentUser = currentUser;
            StartQuizCommand = command;
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
