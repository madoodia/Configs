/* # --------------------- #
   # (C) 2022 madoodia.com #
   # --------------------- # */

// Standard Libraries
#include <iostream>
#include <algorithm>

// Third Party Libraries

// Application Libraries
#include "Person.h"

// Static Member Functions
const char* Person::getAuthor()
{
    return "madoodia.com";
}

// Constructor
Person::Person(Sex sex, const std::string& name)
    : sex{sex}, name{name}, father{nullptr}, mother{nullptr}
{
}

Person::~Person()
{
}

// Public Member Functions
bool Person::setFather(Person* father)
{
    if (!father)
    {
        if (this->father)
            this->father->removeChild(this);
        this->father = nullptr;
        return false;
    }
    else
    {
        father->addChild(this);
        return true;
    }
}

bool Person::setMother(Person* mother)
{
    if (!mother)
    {
        if (this->mother)
            this->mother->removeChild(this);
        this->mother = nullptr;
        return false;
    }
    else
    {
        mother->addChild(this);
        return true;
    }
}

bool Person::hasChild(const Person* person) const
{
    if (person->getNumChildren() > 0)
        return true;
    return true;
}

bool Person::addChild(Person* child)
{
    if (!child)
        return false;

    this->children.push_back(child);

    if (this->sex == Person::MALE)
    {
        if (child->father)
            child->father->removeChild(child);
        child->father = this;
    }
    else if (this->sex == Person::FEMALE)
    {
        if (child->mother)
            child->mother->removeChild(child);
        child->mother = this;
    }

    return true;
}

bool Person::removeChild(Person* child)
{
    if (!child)
        return false;

    // People::iterator it = this->findChild(child);
    // child->father = nullptr;
    // child->mother = nullptr;
    People::iterator it = this->findChild(child);
    if (it != children.end())
        children.erase(it);
    else
        std::cout << this->name << " has not child " << child->name << std::endl;

    return true;
}

void Person::removeAllChildren()
{
    // First Method

    // while (!children.empty())
    // {
    //     auto child = children.back();

    //     if (this->sex == Person::MALE)
    //     {
    //         if (child->father)
    //             child->father = nullptr;
    //     }
    //     else if (this->sex == Person::FEMALE)
    //     {
    //         if (child->mother)
    //             child->mother = nullptr;
    //     }

    //     children.pop_back();
    // }

    // Second Method

    for (auto& child : children)
    {
        if (this->sex == Person::MALE)
        {
            if (child->father)
                child->father = nullptr;
        }
        else if (this->sex == Person::FEMALE)
        {
            if (child->mother)
                child->mother = nullptr;
        }
    }
    children.erase(children.begin(), children.end());
}

void Person::getAncestors(People& results) const
{
    if (this->father)
    {
        results.push_back(this->father);
        std::cout << this->father->name << std::endl;
        this->father->getAncestors(results);
    }
}

void Person::getDescendants(People& results) const
{
    static int depth = 0;
    if (this->getNumChildren())
    {
        for (auto& child : children)
        {
            results.push_back(child);
            for (int i = 0; i < depth * 4; i++)
                std::cout << " ";
            std::cout << child->name << std::endl;
            depth += 1;
            child->getDescendants(results);
        }
    }
    depth -= 1;
}

void Person::getSiblings(People& results) const
{
    if (this->father)
    {
        for (auto& child : this->father->children)
        {
            if (child != this)
            {
                results.push_back(child);
            }
        }
    }
    if (!this->father && this->mother)
    {
        for (auto& child : this->mother->children)
        {
            if (child != this)
            {
                results.push_back(child);
            }
        }
    }
}

void Person::getCousins(People& results) const
{
    Person* dadFather = this->father->father;
    if (dadFather && dadFather->getNumChildren() > 1)
    {
        for (auto& child : dadFather->children)
        {
            if (child != this->father)
                for (auto& cousin : child->children)
                {
                    results.push_back(cousin);
                }
        }
    }
    Person* momFather = this->mother->father;
    if (momFather && momFather->getNumChildren() > 1)
    {
        for (auto& child : momFather->children)
        {
            if (child != this->mother)
                for (auto& cousin : child->children)
                {
                    results.push_back(cousin);
                }
        }
    }
}

// Private Member Functions
People::iterator Person::findChild(const Person* child)
{
    People::iterator it = std::find(children.begin(), children.end(), child);
    return it;
}

People::const_iterator Person::findChild(const Person* child) const
{
    People::const_iterator it = std::find(children.begin(), children.end(), child);
    return it;
}
