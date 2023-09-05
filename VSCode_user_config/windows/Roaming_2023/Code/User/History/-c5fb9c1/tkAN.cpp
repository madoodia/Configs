/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

// method 1

#include <sstream>

// method 2
#include <string>

std::string str = "hello world";
std::string delimiter = " ";
std::vector<std::string> words;
size_t pos = 0;
std::string token;
while ((pos = str.find(delimiter)) != std::string::npos)
{
  token = str.substr(0, pos);
  words.push_back(token);
  str.erase(0, pos + delimiter.length());
}
words.push_back(str);