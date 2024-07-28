using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace C__Homework__2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Задание №1");

            double[] A = new double[5];
            double[] B = new double[5];

            for (int i = 0; i < A.Length; i++)
            {
                Console.Write("Enter number: ");
                A[i] = Convert.ToDouble(Console.ReadLine());
            }
            Console.WriteLine();

            PrintArr("First array: ", A);
            FillRandom(B);
            PrintArr("Second array: ", B);
            Console.WriteLine();

            Console.WriteLine("Common MAX element: " + CommonMax(A, B));
            Console.WriteLine("Common MIN element: " + CommonMin(A, B));
            Console.WriteLine("Common Sum of two arrays: " + CommonSum(A, B));
            Console.WriteLine("Common Multiply of two arrays: " + CommonMultiply(A, B));
            Console.WriteLine("Sum of all even elements of the first array: " + EvenSum(A));
            Console.WriteLine("Sum of all odd elements of the second array: " + OddSum(B));

            Console.ReadKey();

            Console.WriteLine("------------\n");

            Console.WriteLine("Задание №2");

            int[,] array2D = new int[5, 5];
            int[] array1D = new int[25];
            int max, min, iMax = 0, iMin = 0, sum = 0;

            Random random = new Random();

            FillRandom2D(array2D);
            PrintArr2D("array Z: ", array2D);
            Console.WriteLine();

            // Переводим в одномерный массив, чтобы легче было посчитать
            array1D = Change(array2D, array1D);
            
            for (int i = 0; i < array1D.Length; i++)
            {
                if (array1D[iMax] < array1D[i])
                {
                    iMax = i;
                }
                
                if (array1D[iMin] > array1D[i])
                {
                    iMin = i;
                }
            }

            max = MaxArr(array1D);
            min = MinArr(array1D);
            Console.WriteLine("MAX: " + max);
            Console.WriteLine("MIN: " + min + '\n');

            if (iMin < iMax) 
            {
                for (int i = iMin + 1; i < iMax; i++)
                    sum = sum + array1D[i];
            }
            else
            {
                for (int i = iMax + 1; i < iMin; i++)
                    sum = sum + array1D[i];
            }

            Console.WriteLine("Summ: " + sum);

            Console.ReadLine();
        }
        static void FillRandom(double[] arr)
        {
            Random random = new Random();
            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = Math.Round(random.Next(0, 11) + random.NextDouble(), 1);
            }
        }
        static void FillRandom2D(int[,] arr)
        {
            Random random = new Random();
            for (int i = 0; i < arr.GetLength(0); i++)
            {
                for (int j = 0; j < arr.GetLength(1); j++)
                    arr[i, j] = random.Next(-20, 21);
            }
        }
        static void PrintArr(string text, double[] arr)
        {
            Console.Write(text + ": ");
            for (int i = 0; i < arr.Length; i++)
            {
                Console.Write(arr[i] + " ");
            }
            Console.WriteLine();
        }
        static void PrintArr2D(string text, int[,] arr)
        {
            Console.WriteLine(text + ": ");
            for (int i = 0; i < arr.GetLength(0); i++)
            {
                for (int j = 0; j < arr.GetLength(1); j++)
                    Console.Write(arr[i, j] + " ");

                Console.WriteLine();
            }
        }
        static double CommonMax(double[] arr1, double[] arr2)
        {
            double max1 = double.MinValue, max2 = double.MinValue, commonMax;

            for (int i = 0; i < arr1.Length; i++)
            {
                if (arr1[i] > max1)
                    max1 = arr1[i];
            }

            for (int i = 0; i < arr2.Length; i++)
            {
                if (arr2[i] > max2)
                    max2 = arr2[i];
            }

            if (max1 > max2)
                commonMax = max1;
            else
                commonMax = max2;

            return commonMax;
        }
        static double CommonMin(double[] arr1, double[] arr2)
        {
            double min1 = double.MaxValue, min2 = double.MaxValue, commonMin;

            for (int i = 0; i < arr1.Length; i++)
            {
                if (arr1[i] < min1)
                    min1 = arr1[i];
            }

            for (int i = 0; i < arr2.Length; i++)
            {
                if (arr2[i] < min2)
                    min2 = arr2[i];
            }

            if (min1 < min2)
                commonMin = min1;
            else
                commonMin = min2;

            return commonMin;
        }
        static double CommonSum(double[] arr1, double[] arr2)
        {
            double sum1 = 0, sum2 = 0, commonSum = 0;

            for (int i = 0; i < arr1.Length; i++)
            {
                sum1 += arr1[i];
            }

            for (int i = 0; i < arr2.Length; i++)
            {
                sum2 += arr2[i];
            }

            commonSum = sum1 + sum2;

            return commonSum;
        }
        static double CommonMultiply(double[] arr1, double[] arr2)
        {
            double mult1 = 1, mult2 = 1, commonMult = 0;

            for (int i = 0; i < arr1.Length; i++)
            {
                mult1 *= arr1[i];
            }

            for (int i = 0; i < arr2.Length; i++)
            {
                mult2 *= arr2[i];
            }

            commonMult = mult1 * mult2;

            return commonMult;
        }
        static double EvenSum(double[] arr)
        {
            double evenSum = 0;

            for (int i = 0; i < arr.Length; i++)
            {
                if (i % 2 == 0)
                    evenSum += arr[i];
            }

            return evenSum;
        }
        static double OddSum(double[] arr)
        {
            double oddSum = 0;

            for (int i = 0; i < arr.Length; i++)
            {
                if (i % 2 != 0)
                    oddSum += arr[i];
            }

            return oddSum;
        }
        static int MaxArr(int[] arr)
        {
            int max = int.MinValue;
            for (int i = 0; i < arr.Length; i++)
            {
                max = max < arr[i] ? arr[i] : max;
            }
            return max;
        }
        static int MinArr(int[] arr)
        {
            int min = int.MaxValue;
            for (int i = 0; i < arr.Length; i++)
            {
                min = min > arr[i] ? arr[i] : min;
            }
            return min;
        }
        static int[] Change(int[,] arr1, int[] arr2)
        {
            int z = 0;
            for (int i = 0; i < 5; i++)
                for (int j = 0; j < 5; j++)
                {
                    arr2[z] = arr1[i, j];
                    z++;
                }
            return arr2;
        }
    }
}
