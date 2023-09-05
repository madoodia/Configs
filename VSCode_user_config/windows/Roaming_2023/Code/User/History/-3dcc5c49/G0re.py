# This is a demo task.

# Write a python function:

# int solution(vector<int> &A);

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].

# -----------------------------------------
# you can write to stdout for debugging purposes, e.g.
# print("this is a debug message")

def solution(A):
    result = 1
    for each in A:
        if each == result:
            result += 1
    while True:
        if result in A:
            result += 1
        else:
            break
    return result

# -------------------------------
def solution(A):
    A = set(A)
    for i in range(1, 100001):
        if i not in A:
            return i
    return 1

# ================================
// you can use includes, for example:
// #include <algorithm>
#include <unordered_set>

// you can write to stdout for debugging purposes, e.g.
// cout << "this is a debug message" << endl;

int solution(vector<int> &A) {
    unordered_set<int> s;
    for (auto a : A) {
        if (a > 0) s.insert(a);
    }
    for (int i = 1; i <= 100000; i++) {
        if (!s.count(i)) return i;
    }
    return 1;
}
