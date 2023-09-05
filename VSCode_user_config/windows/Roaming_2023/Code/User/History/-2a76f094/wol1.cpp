/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/
#include <string>

// create a class of student
class Student
{
public:
  Student(std::string name, int age, int grade)
  {
    this->name = name;
    this->age = age;
    this->grade = grade;
  }

  // a function to print the student
  void print()
  {
    std::cout << "Name: " << name << " Age: " << age << " Grade: " << grade << std::endl;
  }

  // a static member function to compare students
  static bool compareStudents(Student s1, Student s2)
  {
    return s1.grade > s2.grade;
  }

  std::string name;
  int age;
  int grade;
};
