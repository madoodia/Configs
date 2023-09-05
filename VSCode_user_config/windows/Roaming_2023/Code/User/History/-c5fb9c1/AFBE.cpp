/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <sstream>

std::string str = "hello world";
std::stringstream ss(str);
std::string word;
std::vector<std::string> words;
while (ss >> word)
{
  words.push_back(word);
}
