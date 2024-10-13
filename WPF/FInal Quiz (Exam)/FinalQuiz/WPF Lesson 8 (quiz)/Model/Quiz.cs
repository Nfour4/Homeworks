﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using WPF_Lesson_8__quiz_.ViewModel;

namespace WPF_Lesson_8__quiz_.Model
{
    public class Quiz
    {
        public List<Question> Questions { get; set; }
        public string Name { get; set; }
        public Quiz(List<Question> questions, string name)
        {
            Questions = questions;
            Name = name;
        }
        public static Quiz GenerateQuiz()
        {
            List<Question> questions = new List<Question>();
            for (int j = 0; j < 10; j++)
            {
                List<Answer> answers = new List<Answer>();
                for (int i = 0; i < 3; i++)
                {
                    answers.Add(new Answer($"Option {i + 1}",
                                           i == 1));
                }
                questions.Add(new Question($"Question {j + 1}?",
                                           answers));
            }
            return new Quiz(questions, "Quiz name");
        }
    }
}