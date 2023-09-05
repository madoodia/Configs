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
    Person* madoodia = new Person(Person::MALE, "madoodia");
    Person* negar = new Person(Person::FEMALE, "Negar");

    ryan->setFather(madoodia);
    ryan->setFather(reza);
    // ryan->setFather(nullptr);
    ryan->setMother(negar);

    std::cout << ryan->name << std::endl;
    // TODO: we can have getName() instead
    std::cout << ryan->getFather()->name << std::endl;
    std::cout << ryan->getMother()->name << std::endl;

    std::cout << reza->getNumChildren() << std::endl;
    std::cout << negar->getNumChildren() << std::endl;

    std::cout << reza->hasChild(ryan) << std::endl; // true
    std::cout << ryan->hasChild(reza) << std::endl; // false

    Person* dyan = new Person(Person::FEMALE, "Dyan");
    std::cout << reza->addChild(dyan) << std::endl;
    std::cout << madoodia->addChild(dyan) << std::endl;
    // TODO: need a member data named spouse, to addChild automatically to spouse too
    std::cout << negar->addChild(dyan) << std::endl;

    std::cout << reza->getNumChildren() << std::endl;
    std::cout << negar->getNumChildren() << std::endl;

    std::cout << reza->removeChild(dyan) << std::endl;

    std::cout << reza->getChild(0)->name << std::endl;

    reza->removeAllChildren();
    std::cout << reza->getNumChildren() << std::endl;
    madoodia->removeAllChildren();
    std::cout << madoodia->getNumChildren() << std::endl;
    negar->removeAllChildren();
    std::cout << negar->getNumChildren() << std::endl;

    People ancesstors;
    reza->getAncestors(ancesstors);

    People descendants;
    reza->getAncestors(descendants);

    People cousins;
    reza->getAncestors(cousins);

    delete reza;
    delete negar;
    delete ryan;
    delete dyan;

    return 0;
}
