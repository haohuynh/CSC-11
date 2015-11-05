/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on November 4, 2015, 5:06 PM
 */

#include <iostream>

using namespace std;

/**
 * This function find the value of a term in the Fibonacci sequence by recursive method
 * @param n : the position in the Fibonacci sequence
 * @return the value at position n in the Fibonacci sequence 
 */
int generateFibonacciTerm(int n) {
    if (n <= 2) { // The stop condition
        return 1;
    }

    return generateFibonacciTerm(n - 1) + generateFibonacciTerm(n - 2);

}

/*
 * The main thread 
 */
int main(int argc, char** argv) {

    int n;

    do {

        cout << "\nPlease enter a position in the Fibonacci sequence or -1 stop this program: ";
        cin >> n;

        if (n == -1) {
            break;
        } else {
            cout << "The result is: " << generateFibonacciTerm(n);
        }
    } while (true);


    return 0;
}

