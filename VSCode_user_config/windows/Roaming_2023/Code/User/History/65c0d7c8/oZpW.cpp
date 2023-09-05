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
    // Person* Mahmoodreza = new Person(Person::MALE, "Mahmoodreza");
    Person* negar = new Person(Person::FEMALE, "Negar");

    Person* alireza = new Person(Person::MALE, "Alireza");
    Person* banoo = new Person(Person::FEMALE, "Banoo");

    Person* shokat = new Person(Person::MALE, "Shokat");
    Person* dariush = new Person(Person::MALE, "Dariush");

    Person* ahmadreza2 = new Person(Person::MALE, "Ahmadreza");
    Person* raheleh = new Person(Person::FEMALE, "Raheleh");
    Person* mahdi = new Person(Person::MALE, "Mahdi");

    Person* saami = new Person(Person::FEMALE, "Saami");
    Person* reza = new Person(Person::MALE, "Reza");

    Person* agha = new Person(Person::MALE, "Agha");
    Person* nane = new Person(Person::FEMALE, "Nane");

    Person* ahmadreza = new Person(Person::MALE, "Ahmadreza");
    Person* golnesa = new Person(Person::FEMALE, "Golnesa");

    People ancesstors;
    reza->getAncestors(ancesstors);

    People descendants;
    reza->getAncestors(descendants);

    People cousins;
    reza->getAncestors(cousins);

    return 0;
}
