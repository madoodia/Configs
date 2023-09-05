/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <sstream>
#include <string>
#include <vector>

// remove empty elements from a vector of strings
void remove_empty_elements(std::vector<std::string>& words)
{
  words.erase(std::remove_if(words.begin(), words.end(), [](const std::string& word)
                             { return word.empty(); }),
              words.end());
}

// or
int main()
{
  // method 1
  {
    std::vector<std::string> vec = {"hello", "", "world", "", "", "c++"};
    vec.erase(std::remove(vec.begin(), vec.end(), ""), vec.end());
  }

  // method 2
  {
    std::vector<std::string> vec = {"hello", "", "world", "", "", "c++"};
    vec.erase(std::remove_if(vec.begin(), vec.end(), [](const std::string& s)
                             { return s.empty(); }),
              vec.end());
  }
}