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
  std::cout << myString.size() << std::endl;

  // assign a new value to the first element of the string
  myString.at(0) = 'G';
  std::cout << myString << std::endl;

  // assign a new value to the last element of the string
  myString.at(myString.size() - 1) = '?';
  std::cout << myString << std::endl;

}