/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <sstream>
#include <string>
#include <vector>

int main()
{
  // method 1
  {
    std::string str = "hello world";
    std::istringstream iss(str);
    std::vector<std::string> words;
    std::string word;
    while (iss >> word)
    {
      words.push_back(word);
    }
  }

  // method 2
  {

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
  }
  // method 3
  {
    std::string str = "hello world";
    std::string delimiter = " ";
    std::vector<std::string> words;
    size_t pos = 0;
    while ((pos = str.find_first_of(delimiter)) != std::string::npos)
    {
      words.push_back(str.substr(0, pos));
      str = str.substr(pos + 1);
    }
    words.push_back(str);
  }
