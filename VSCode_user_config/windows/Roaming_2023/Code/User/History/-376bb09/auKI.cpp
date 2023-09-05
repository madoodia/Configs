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
