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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WPF_Homework__3__final_calc_
{
    public partial class MainWindow : Window
    {
        private decimal num1, num2, result, bs1, bs2;
        private bool isClearBottom, isEqualPressed;
        private string currentOperation;
        public MainWindow()
        {
            InitializeComponent();
            SetupEvents();
            SetText_Bottom("0");

            num1 = 0;
            num2 = 0;
            result = 0;

            isClearBottom = false;
            isEqualPressed = false;

            currentOperation = string.Empty;
        }
        private void SetupEvents()
        {
            List<Button> buttons = new List<Button>()
            {
                btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9
            };

            buttons.ForEach(button =>
            {
                button.Click += Button_Click;
            });

            List<Button> buttonsOP = new List<Button>()
            {
                btnDivision, btnMinus, btnMultiplication, btnPlus
            };

            buttonsOP.ForEach(button =>
            {
                button.Click += ButtonOP_Click;
            });

            btnEqual.Click += ButtonEqual_Click;
            btnDot.Click += ButtonDot_Click;
            btnClearEntry.Click += BtnClearEntry_Click;
            btnClearAll.Click += BtnClearAll_Click;
            btnBS.Click += BtnBS_Click;
        }
        private void SetText_Bottom(string txt)
        {
            if (bottomInput.Text == "0")
                bottomInput.Text = txt;
            else if (isClearBottom)
            {
                bottomInput.Text = txt;
                isClearBottom = false;
            }
            else
                bottomInput.Text += txt;
        }
        private void SetText_Top(string txt)
        {
            topInput.Text = txt;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (!isEqualPressed) SetText_Bottom((string)(sender as Button).Content);
            else if (isEqualPressed && currentOperation != string.Empty)
            {
                topInput.Text = bottomInput.Text + currentOperation;
                SetText_Bottom((string)(sender as Button).Content);
                isEqualPressed = false;
            }
            else
            {
                topInput.Text = string.Empty;
                SetText_Bottom((string)(sender as Button).Content);
                isEqualPressed = false;
            }
        }
        private void ButtonOP_Click(object sender, RoutedEventArgs e)
        {
            string operation = (string)(sender as Button).Content;
            if (currentOperation == string.Empty)
            {
                num1 = Convert.ToDecimal(bottomInput.Text);
                SetText_Top(bottomInput.Text + operation);
            }
            else
            {
                num2 = Convert.ToDecimal(bottomInput.Text);
                result = doOperation(num1, num2, currentOperation);

                SetText_Top(result + operation);
                isClearBottom = true;
                SetText_Bottom(result.ToString());

                num1 = result;
            }

            currentOperation = operation;
            isClearBottom = true;
        }
        private void ButtonEqual_Click(object sender, RoutedEventArgs e)
        {
            num2 = Convert.ToDecimal(bottomInput.Text);
            result = doOperation(num1, num2, currentOperation);

            SetText_Top(topInput.Text + num2 + "=");
            isClearBottom = true;
            SetText_Bottom(result.ToString());

            num1 = result;
            currentOperation = String.Empty;
            isClearBottom = true;
            isEqualPressed = true;
        }
        private decimal doOperation(decimal n1, decimal n2, string op)
        {
            switch (op)
            {
                case "+":
                    return n1 + n2;
                case "-":
                    return n1 - n2;
                case "*":
                    return n1 * n2;
                case "/":
                    return n1 / n2;
            }
            return 0;
        }
        private void ButtonDot_Click(object sender, RoutedEventArgs e)
        {
            if (bottomInput.Text.Contains(",")) return;
            if (bottomInput.Text == "0")
            {
                SetText_Bottom("0,");
            }
            else
            {
                SetText_Bottom(",");
            }
        }
        private void BtnBS_Click(object sender, RoutedEventArgs e)
        {
            if (bottomInput.Text.Length == 1) bottomInput.Text = "0";
            else if (isEqualPressed)
            {
                topInput.Text = string.Empty;
                isEqualPressed = false;
            }
            else
            {
                bs1 = Convert.ToDecimal(bottomInput.Text);
                bs2 = bs1 % 10;
                bottomInput.Text = ((bs1 - bs2) / 10).ToString();
            }
        }
        private void BtnClearAll_Click(object sender, RoutedEventArgs e)
        {
            bottomInput.Text = "0";
            topInput.Text = string.Empty;
            num1 = 0;
            num2 = 0;
            result = 0;
            isClearBottom = false;
            isEqualPressed = false;
            currentOperation = string.Empty;
        }
        private void BtnClearEntry_Click(object sender, RoutedEventArgs e)
        {
            if (isEqualPressed)
            {
                bottomInput.Text = "0";
                topInput.Text = string.Empty;
            }
            else bottomInput.Text = "0";
        }
    }
}
