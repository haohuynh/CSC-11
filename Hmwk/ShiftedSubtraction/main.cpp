/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on September 28, 2015, 8:23 PM
 */

#include <iostream>

using namespace std;

/*
 * This program applies the shifted subtraction method for a division operator 
 */
int main(int argc, char** argv) {

    int R1 = 0x75E688E; // The Numerator

    int R2 = 6; // The Denominator

    int R3 = 1; // The Scalar

    int R4 = R2; // A copy of the denominator

    int R0 = 0; // The Quotient

    if (R2 > R1) { // If the denominator is greater than the numerator, the result is zero 
        cout << R0;
        return 0;
    }

    //Shift the denominator to the left until it is greater or equal to the numerator
    while (R1 > R2) {
        R2 <<= 1;
        R3 <<= 1;
    }

    do {//Updating the new coefficient if possible

        while (R2 > R1) {//Shift the denominator to the right until it is less than or equal to the numerator
            R2 >>= 1;
            R3 >>= 1;
        }

        if (R2 >= R4) {
            R1 -= R2;
            R0 += R3;
        }else {
            break;
        }


    } while (true);


    cout << R0;
    cout << "\n" << R1;
    return 0;
}

