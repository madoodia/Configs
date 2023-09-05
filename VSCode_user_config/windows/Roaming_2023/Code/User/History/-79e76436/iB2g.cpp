/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <iostream>
#include <string>
#include <map>
#include <vector>


int main ()
{
  std::vector<std::string> myvector = {
                "alpha",
                "beta",
                "gamma" };
  
  std::cout << myvector.at(0).at(0) << std::endl;

  return 0;
}