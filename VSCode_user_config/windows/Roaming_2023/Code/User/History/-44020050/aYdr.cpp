/*
# -------------------- #
# (C)2022 madoodia.com #
# -------------------- #
*/

// Standard Libraries
#include <iostream>

// Third Party Libraries

// Application Libraries
#include "Person.h"

// Main Function
int main()
{
    std::cout << "Family Blood Tree!" << std::endl;

    Person* ryan = new Person(Person::MALE, "Ryan");
    Person* reza = new Person(Person::MALE, "Reza");
    Person* negar = new Person(Person::MALE, "Negar");

    ryan->setFather(reza);
    ryan->setMother(negar);

    std::cout << ryan->getFather().getName() << std::endl;
    std::cout << ryan->getMother().getName() << std::endl;

    return 0;
}
