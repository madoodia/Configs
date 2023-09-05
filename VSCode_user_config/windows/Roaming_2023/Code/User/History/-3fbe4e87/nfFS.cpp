/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <sstream>
#include <string>
#include <vector>
#include <format>

int main()
{
  // concatenate strings
  {
    std::string str1 = "hello";
    std::string str2 = "world";
    std::string str3 = str1 + " " + str2;
  }

  // method 2
  {
    std::string str1 = "hello";
    std::string str2 = "world";
    std::string str3 = std::format("{} {}", str1, str2);
  }
}