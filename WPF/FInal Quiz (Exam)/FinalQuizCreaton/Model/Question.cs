using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Homework__8__quiz_creation_.Model
{
    public class Question
    {
        public string Text { get; set; }
        public List<Answer> Answers { get; set; }
        [System.Xml.Serialization.XmlIgnore]
        public int CorrectAnswer 
        {
            get
            {
                return Answers.FindIndex(a => a.IsCorrect) + 1;
            }
            private set { } 
        }
        public Question(string text, List<Answer> answers)
        {
            Text = text;
            Answers = answers;
        }
        public Question() 
        {
            Text = string.Empty;
            Answers = new List<Answer>()
            {
                new Answer(string.Empty, true),
                new Answer(string.Empty, false),
                new Answer(string.Empty, false)
            };
        }
        public override string ToString()
        {
            return $"{Text} {Answers[0].Text}";
        }
    }
}
