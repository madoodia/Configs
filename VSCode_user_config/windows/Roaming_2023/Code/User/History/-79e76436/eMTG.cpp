/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <iostream>
#include <string>
#include <map>
#include <vector>

int main()
{
  std::vector<std::string> myVector = {
      "alpha",
      "beta",
      "gamma"};

  std::cout << myVector.at(0).at(0) << std::endl; // myVector[0][0]
  // or
  std::cout << myVector[0][0] << std::endl; // myVector[0][0]

  // assign a new value to the first element of the first string
  myVector.at(0).at(0) = 'A';
  // or
  myVector[0][0] = 'A';

  myVector.push_back("delta");
  myVector.push_back("epsilon");

  std::cout << myVector[2][3] << std::endl;

  std::cout << myVector[0] << std::endl; // myVector[0]
  std::cout << myVector[1] << std::endl; // myVector[1]
  std::cout << myVector[2] << std::endl; // myVector[2]
  std::cout << myVector[3] << std::endl; // myVector[3]
  std::cout << myVector[4] << std::endl; // myVector[4]
  

  return 0;
}