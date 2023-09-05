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
    Person* madoodia = new Person(Person::MALE, "Madoodia");
    Person* mahdi = new Person(Person::MALE, "Mahdi");

    Person* alireza = new Person(Person::MALE, "Alireza");
    Person* banoo = new Person(Person::FEMALE, "Banoo");

    Person* ahmadreza = new Person(Person::MALE, "Ahmadreza");
    Person* golnesa = new Person(Person::FEMALE, "Golnesa");
    Person* taghi = new Person(Person::MALE, "Taghi");
    Person* jabin = new Person(Person::FEMALE, "Jabin");

    Person* morteza = new Person(Person::MALE, "Morteza");
    Person* khatoon = new Person(Person::FEMALE, "Khatoon");

    Person* arian = new Person(Person::MALE, "Arian");
    Person* baran = new Person(Person::FEMALE, "Baran");

    Person* fateme = new Person(Person::FEMALE, "Fateme");
    Person* milad = new Person(Person::MALE, "Milad");
    Person* meisam = new Person(Person::MALE, "Meisam");
    Person* mohammad = new Person(Person::MALE, "Mohammad");

    Person* shahreza = new Person(Person::MALE, "Shahreza");
    Person* yasin = new Person(Person::MALE, "Yasin");

    Person* pari = new Person(Person::FEMALE, "Pari");
    Person* peiman = new Person(Person::MALE, "Peiman");
    Person* amir = new Person(Person::MALE, "Amir");

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

    Person* bahram = new Person(Person::MALE, "Bahram");
    Person* erfan = new Person(Person::MALE, "Erfan");

    // .......................
    ryan->setFather(madoodia);
    ryan->setMother(negar);
    madoodia->setFather(alireza);
    madoodia->setMother(banoo);
    alireza->setFather(ahmadreza);
    ahmadreza->setFather(morteza);
    ahmadreza->setMother(khatoon);
    ahmadreza2->setFather(alireza);
    ahmadreza2->setMother(banoo);
    raheleh->setMother(banoo);
    mahdi->setMother(banoo);
    raheleh->setFather(alireza);
    mahdi->setFather(alireza);
    arian->setFather(ahmadreza2);
    baran->setFather(ahmadreza2);
    yasin->setFather(shahreza);
    shahreza->setFather(morteza);
    fateme->setFather(ahmadreza);
    fateme->setMother(golnesa);
    milad->setMother(fateme);
    meisam->setMother(fateme);
    mohammad->setMother(fateme);
    alireza->setMother(golnesa);
    banoo->setMother(jabin);
    banoo->setFather(taghi);
    pari->setFather(taghi);
    pari->setMother(jabin);
    peiman->setMother(pari);
    amir->setFather(peiman);
    // .......................
    negar->setMother(shokat);
    negar->setFather(dariush);
    saami->setMother(shokat);
    saami->setFather(dariush);
    reza->setMother(shokat);
    reza->setFather(dariush);
    shokat->setMother(nane);
    shokat->setFather(agha);
    bahram->setMother(nane);
    bahram->setFather(agha);
    erfan->setMother(bahram);
    erfan->setFather(bahram);
    artemis->setMother(saami);
    dariush->setFather(heidar);
    dariush->setMother(taaj);
    // .......................
    People ancesstors;
    std::cout << "Ancesstors of " << madoodia->name << std::endl;
    madoodia->getAncestors(ancesstors);
    std::cout << "----------------------" << std::endl;

    // People descendants;
    // std::cout << "descendants of " << morteza->name << std::endl;
    // morteza->getDescendants(descendants);
    // std::cout << "----------------------" << std::endl;

    // People descendants;
    // std::cout << "descendants of " << heidar->name << std::endl;
    // heidar->getDescendants(descendants);
    // std::cout << "----------------------" << std::endl;

    People descendants;
    std::cout << "descendants of " << milad->name << std::endl;
    milad->getDescendants(descendants);
    std::cout << "----------------------" << std::endl;

    People siblings;
    std::cout << "siblings of " << milad->name << std::endl;
    milad->getSiblings(siblings);
    for (auto& element : siblings)
    {
        std::cout << element->name << std::endl;
    }
    std::cout << "----------------------" << std::endl;

    People cousins;
    std::cout << "cousins of " << madoodia->name << std::endl;
    madoodia->getCousins(cousins);
    std::cout << "----------------------" << std::endl;

    return 0;
}
