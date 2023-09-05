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

    // .......................
    Person* ahmadreza2 = new Person(Person::MALE, "Ahmadreza");
    Person* raheleh = new Person(Person::FEMALE, "Raheleh");
    Person* mahmoodreza = new Person(Person::MALE, "Mahmoodreza");
    Person* mahdi = new Person(Person::MALE, "Mahdi");

    Person* alireza = new Person(Person::MALE, "Alireza");
    Person* banoo = new Person(Person::FEMALE, "Banoo");

    Person* ahmadreza = new Person(Person::MALE, "Ahmadreza");
    Person* golnesa = new Person(Person::FEMALE, "Golnesa");
    Person* taghi = new Person(Person::MALE, "Taghi");
    Person* Jabin = new Person(Person::FEMALE, "Jabin");

    Person* arian = new Person(Person::MALE, "Arian");
    Person* baran = new Person(Person::FEMALE, "Baran");

    Person* fateme = new Person(Person::FEMALE, "Fateme");
    Person* milad = new Person(Person::MALE, "Milad");
    Person* meisam = new Person(Person::MALE, "Meisam");
    Person* mohammad = new Person(Person::MALE, "Mohammad");

    Person* shahreza = new Person(Person::MALE, "Shahreza");
    Person* yasin = new Person(Person::MALE, "Yasin");

    // .......................
    Person* saami = new Person(Person::FEMALE, "Saami");
    Person* negar = new Person(Person::FEMALE, "Negar");
    Person* reza = new Person(Person::MALE, "Reza");

    Person* artemis = new Person(Person::FEMALE, "Artemis");

    Person* shokat = new Person(Person::MALE, "Shokat");
    Person* dariush = new Person(Person::MALE, "Dariush");

    Person* agha = new Person(Person::MALE, "Agha");
    Person* nane = new Person(Person::FEMALE, "Nane");
    Person* heidar = new Person(Person::MALE, "Heidar");
    Person* taaj = new Person(Person::FEMALE, "Taaj");

    Person* heidar = new Person(Person::MALE, "Heidar");
    Person* taaj = new Person(Person::FEMALE, "Taaj");

    // .......................
    People ancesstors;
    reza->getAncestors(ancesstors);

    People descendants;
    reza->getAncestors(descendants);

    People siblings;
    reza->getSiblings(siblings);

    People cousins;
    reza->getAncestors(cousins);

    return 0;
}
