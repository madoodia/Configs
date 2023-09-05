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

    std::cout << ryan->name << std::endl;
    std::cout << ryan->getFather()->name << std::endl; // we can have getName() instead
    std::cout << ryan->getMother()->name << std::endl;

    std::cout << reza->getNumChildren() << std::endl;
    std::cout << negar->getNumChildren() << std::endl;

    std::cout << reza->hasChild(ryan) << std::endl; // true
    std::cout << ryan->hasChild(reza) << std::endl; // false

    Person* dyan = new Person(Person::MALE, "Dyan");
    std::cout << reza->addChild(dyan) << std::endl;

    std::cout << reza->getNumChildren() << std::endl;
    std::cout << negar->getNumChildren() << std::endl;

    // std::cout << reza->removeChild(dyan) << std::endl;

    // std::cout << reza->getChild(0) << std::endl;

    // reza->removeAllChildren();
    // std::cout << reza->getNumChildren() << std::endl;

    // People ancesstors;
    // reza->getAncestors(ancesstors);

    // People descendants;
    // reza->getAncestors(descendants);

    // People cousins;
    // reza->getAncestors(cousins);

    return 0;
}
