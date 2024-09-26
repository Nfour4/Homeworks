using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WPF_Homework__6.Model;

namespace WPF_Homework__6.ViewModel
{
    public class TemperatureViewModel : INotifyPropertyChanged
    {
        public ICommand Change { get; set; }
        private Temperature _calculate;
        public Temperature Calculate
        {
            get
            {
                return _calculate;
            }
            set
            {
                _calculate = value;
                OnPropertyChanged("Calculate");
            }
        }
        public TemperatureViewModel()
        {
            Calculate = new Temperature();
            Change = new DelegateCommand(ChangeTemperature);
        }
        public void ChangeTemperature(Object obj)
        {
            Calculate = new Temperature()
            {
                Celsius = (Calculate.Fahrenheit - 32) / 1.8,
                Fahrenheit = (Calculate.Celsius * 1.8) + 32
            };
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
