   M S B A M L   `   `   `  ����N  JWPF Lesson 8 (quiz), Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:WPF_Lesson_8__quiz_WPF_Lesson_8__quiz_  5   	       WPF_Lesson_8__quiz_.Login   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:WPF_Lesson_8__quiz_     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � Title$ Login��5	   	   $	��200��6   $	��300��6$   .��5
      � 
������� � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��Center=�5      $��0��5      $��18(�5      $��10q�5      $��3q�5      
�����F���5      �� *CurrentUser.Login+ �� UpdateSourceTrigger$ PropertyChanged=�5      �� 5   
   $��Center=�5      $��1��5      $��10q�5      $��3q�5      
�����F�$��18(�5      ��5      �� *CurrentUser.Password+$ PropertyChanged=�5      �� 5    
   $��Login!��6   $��2��5"      $��75��5#      $��30��5$      $
��Bold"�5%      $��3q�5&      
�����F�
������� �� 	IsDefault . ��5!      �� *LoginCommand+5)      5*      5+      