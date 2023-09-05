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
    Person* negar = new Person(Person::FEMALE, "Negar");

    Person* reza = new Person(Person::MALE, "Reza");
    Person* negar = new Person(Person::FEMALE, "Negar");

    People ancesstors;
    reza->getAncestors(ancesstors);

    People descendants;
    reza->getAncestors(descendants);

    People cousins;
    reza->getAncestors(cousins);

    return 0;
}
