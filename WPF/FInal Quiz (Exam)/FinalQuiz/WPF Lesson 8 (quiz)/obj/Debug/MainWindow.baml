   M S B A M L   `   `   `  ����N  JWPF Lesson 8 (quiz), Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:WPF_Lesson_8__quiz_WPF_Lesson_8__quiz_  5   	   $    WPF_Lesson_8__quiz_.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:WPF_Lesson_8__quiz_     5   	   -   5          �Name$  window��5   	    � WindowStartupLocation$ CenterScreen=�5	   	    � Title$ 
MainWindow��5
   	   $	��450��6   $	��800��6)   .��5      � 
�������.+�5   
   ]� .+�5      � $	��Top=�6    � ColumnDefinitions 5      �� 5      $��* �6'   �� 5      $
��Auto �6'    � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   .+�5      �� $
��Left=�6   $��18(�5      $��10q�5      $��DemiBold"�5      $��0��5      ��5      �� *CurrentUser.Login+5      �� 5      $��Logout��6   $��10q�5      $��3q�5      $��18(�5       $��DemiBold"�5!      
�����F�$��5q�5#      
�������$��0��5%      $��1��5&      ��5      �� *LogoutCommand+5&      �� 5'      $
��Left=�6   $��18(�5)      $��DemiBold"�5*      $��10q�5+      $��1��5,      ��5(      �� *CountCurrent+5,      �� 5-      $��Right=�6   $��18(�5/      $��DemiBold"�50      $��10q�51      $��1��52      $��1��53      ��5.      �� *CurrentQuiz.Name+53      54      ]� 55      $��Bottom=�6   .+�56      �� $��Right=�6   $
��Next��57      $	��100��58      $��20q�5:      $��18(�5;      $��DemiBold"�5<      
�����F�$��5q�5>      
���������59      �� *NextQuestion+5?      5@      �� 5A      .+�5B      �� $��Center=�5C      $��18(�5D      $��DemiBold"�5E      ��5B      �� *CurrentQuestion.Text+5E      �� 5F      $��Center=�5G      $��10q�5H      
���������5F      �� *CurrentQuestion.Answers+��5J      �� 5K      .R�5L      �� $��18(�5Q   %   $��2q�5R   %   
�����F���5L   %   �� *Text+��5M   %   �� *Color+��5N   %   ��  �� ElementName$ window�� �� Path$  DataContext.SelectedAnswer���5P   %   �� 5S   %   5U      5W      5X      5Y      5Z      5[      