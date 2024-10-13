using Homework__8__quiz_creation_.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using System.IO;
using System.Xml.Serialization;

namespace Homework__8__quiz_creation_.ViewModel
{
    public class QuizViewModel : INotifyPropertyChanged
    {
        private Window _window;
        private Question _currentQuestion;
        public Question CurrentQuestion 
        {
            get { return _currentQuestion; }
            set 
            { 
                _currentQuestion = value;
                OnPropertyChanged(nameof(CurrentQuestion));
            }
        } 
        private Quiz _currentQuiz;
        public Quiz CurrentQuiz
        {
            get { return _currentQuiz; }
            set 
            {
                _currentQuiz = value;
                OnPropertyChanged(nameof(CurrentQuiz));
            }
        }

        public ICommand AddQuestionCommand { get; set; }
        public ICommand ExportToXMLCommand { get; set; }

        public QuizViewModel(Window window)
        {
            _window = window;

            CurrentQuestion = new Question();
            CurrentQuiz = new Quiz(new List<Question>(), String.Empty);

            AddQuestionCommand = new DelegateCommand(AddQuestionHandler);
            ExportToXMLCommand = new DelegateCommand(ExportToXMLHadler);
        }
        public void AddQuestionHandler(object obj)
        {
            CurrentQuiz.Questions.Add(CurrentQuestion);

            Quiz temp = CurrentQuiz;
            CurrentQuiz = null;
            CurrentQuiz = temp;

            CurrentQuestion = new Question();
        }
        public void ExportToXMLHadler(object obj) 
        {
            try
            {
                string fileName = $"{CurrentQuiz.Name}.xml";
                using (var stream = new FileStream(fileName, FileMode.Create))
                {
                    var serializer = new XmlSerializer(typeof(Quiz));
                    serializer.Serialize(stream, CurrentQuiz);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        public void SetCorrectAnswer(int index)
        {
            for (int i = 0; i < 3; i++)
            {
                CurrentQuestion.Answers[i].IsCorrect = (index == i);
            }
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

