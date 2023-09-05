/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <iostream>
#include <string>

int main()
{
  std::string myString = "Hello World!";
  std::cout << myString << std::endl;

  // assign a new value to the first element of the string
  myString.at(0) = 'H';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = '!';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'd';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = '!';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = ' ';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'C';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'o';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'd';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'e';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = '!';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = ' ';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = 'C';
  std::cout << myString << std::endl;
}