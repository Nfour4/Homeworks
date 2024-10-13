using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace WPF_Lesson_8__quiz_.Model
{
    public class Answer
    {
        public string Text { get; set; }
        public bool IsCorrect { get; set; }
        public SolidColorBrush Color { get; set; }
        public Answer(string text, bool isCorrect)
        {
            Text = text;
            IsCorrect = isCorrect;
            Color = new SolidColorBrush(Colors.AntiqueWhite);
        }
        public void SetColor(bool isSelected)
        {
            if (isSelected)
                Color = new SolidColorBrush(Colors.LightSteelBlue);
            else
                Color = new SolidColorBrush(Colors.AntiqueWhite);
        }
    }
}
