// Task 2:
// Create a program that converts temperature from Celsius to Fahrenheit and vice versa.
// Implement functions to handle both conversions and let the user choose the conversion
// type.

import 'dart:io';


  double celsiusToFahrenheit(double celsius)
  {
    return (celsius * 9 / 5) + 32;
  }

  double fahrenheitToCelsius(double fahrenheit)
  {
    return (fahrenheit - 32) * 5 / 9;
  }
  void main()
  {

    print("Choose the conversion type:");
    print("1. Celsius to Fahrenheit");
    print("2. Fahrenheit to Celsius");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice == 1)
    {

        print("Enter temperature in Celsius:");
        double celsius = double.parse(stdin.readLineSync()!);
        double fahrenheit = celsiusToFahrenheit(celsius);
        print("$celsius degrees Celsius is $fahrenheit degrees Fahrenheit.");
    }
    else if(choice == 2)
     {
      print("Enter temperature in Fahrenheit:");
      double fahrenheit = double.parse(stdin.readLineSync()!);
      double celsius = fahrenheitToCelsius(fahrenheit);
      print("$fahrenheit degrees Fahrenheit is $celsius degrees Celsius.");
    }
    else
      {
      print("Invalid choice. Please enter 1 or 2.");
      }




  }













