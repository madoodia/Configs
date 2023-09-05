/*
# -------------------- #
# (C)2023 madoodia.com #
# -------------------- #
*/

#include <iostream>
#include <array>
#include <vector>

int main()
{
  // initialize array
  {
    // int myArray1[5] = {};
    // int myArray1[] = {1, 2, 3};
    int myArray1[]{1, 2, 3};

  {
    // array of pointers
    int* myArray2[5];
    int a = 1;
    int b = 2;
    int c = 3;
    int d = 4;
    int e = 5;
    myArray2[0] = &a;
    myArray2[1] = &b;
    myArray2[2] = &c;
    myArray2[3] = &d;
    myArray2[4] = &e;
  }

  {
    // array declaration
    int arr1[5];
    int* arr2[5];
    int* arr3[5]{};
    int* arr4[5]{nullptr};
    int* arr7[5]{new int[5]{1, 2, 3, 4, 5}};
    delete[] arr7[0];
  }

  {
    int array[5]{1, 2, 3, 4, 5};
    array[2] = 10;                       // O(1) Complexity
    for (unsigned int i = 0; i < 5; i++) // O(n) Complexity
    {
      std::cout << array[i] << std::endl;
    }
  }

  {
    int array[5]{1, 2, 3, 4, 5};
    for (int i : array) // O(n) Complexity
    {
      if (i == 5)
        std::cout << i << std::endl;
    }
  }

  {
    int a1 = 1;
    int a2 = 2;
    int a3 = 3;
    int a4 = 4;
    int a5 = 5;
    // or
    int aa[5]{1, 2, 3, 4, 5};
  }

  {
    // types of array in C++
    int arr10[5]{1, 2, 3, 4, 5};
    std::array<int, 5> array{1, 2, 3, 4, 5};
    std::vector<int> array2{1, 2, 3, 4, 5};
  }

  {
    int* bigArray2 = new int[1000000000]{}; // for getting large data on memory you should take it on heap not stack
    std::cout << "Size GB:" << (float)sizeof(int) * 1000000000 / (1024 ^ 3)
              << std::endl; // size of the block of memory on the heap

    // std::cout << "Enter Somthing:";
    // std::cin.get();
    delete[] bigArray2;
  }

  return 0;
}
