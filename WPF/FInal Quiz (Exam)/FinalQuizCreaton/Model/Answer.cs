using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;
using static System.Net.Mime.MediaTypeNames;

namespace Homework__8__quiz_creation_.Model
{
    public class Answer
    {
        public string Text { get; set; }
        public bool IsCorrect { get; set; }
        [System.Xml.Serialization.XmlIgnore]
        public SolidColorBrush Color { get; set; }
        public Answer() 
        {
            Text = string.Empty;
            IsCorrect = false;
        }
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
