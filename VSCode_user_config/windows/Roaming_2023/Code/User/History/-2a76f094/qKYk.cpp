/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/
#include <string>
#include <vector>
#include <algorithm>

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

int main()
{
  // create a vector of students
  std::vector<Student> students;

  // add students to the vector
  students.push_back(Student("Mike", 16, 90));
  students.push_back(Student("Jack", 15, 95));
  students.push_back(Student("John", 15, 95));
  students.push_back(Student("Sue", 15, 92));
  students.push_back(Student("Vicky", 17, 85));
  students.push_back(Student("Raj", 16, 93));

  // sort the students by grade
  std::sort(students.begin(), students.end(), Student::compareStudents);

  // print the students
  for (int i = 0; i < students.size(); i++)
  {
    students[i].print();
  }

  return 0;
}