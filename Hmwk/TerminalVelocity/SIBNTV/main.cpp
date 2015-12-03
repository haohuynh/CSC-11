/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 3, 2015, 2:38 PM
 */

#include <cstdlib>
#include <iostream>
using namespace std;

/**
 * Div/Mod by the multiply shifted method 
 * @param R1 : The numerator
 * @param R2 : The denominator
 * @return R1/R2
 */
unsigned int getDivMod(unsigned int R1, unsigned int R2){
    
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
    
    return R0;
}

/**
 * Square root of a number by Newton's method
 * @param R0
 * @return square root of R0
 */
unsigned int sqrt(unsigned int R2){
    
    unsigned int R0; 
    
    unsigned int half = 0x00000001; // WD 1 BP -1
    
    unsigned int R1 = getDivMod(R2,2);
    
    do{
        R0 = R1;
        R1 = half*( R0 + getDivMod(R2,R0));
        R1 >>= 1;
    }while (R1 != R0);
    
    return R1;
}

/*
 * Step 4:
 * Scaled integer with Newton's method and Div Mod function
 */
int main(int argc, char** argv) {
    
    unsigned int w = 0x019EB851; // WD 28 BP -28
    unsigned int pi = 0x000000C9; // WD 8 BP -6
    unsigned int cd = 0x00000001; // WD 1 BP -1
    unsigned int dd = 0x00000005; // WD 8 BP -8  (d^2)
    unsigned int c = 0x0000004E; // WD 15 BP -15
    
    unsigned int half = 0x00000001; // WD 1 BP -1
         
    unsigned int v = sqrt(getDivMod((8*w),(pi*cd*dd*c))); // WD 32 BP 1
    v <<= 1; //WD 32
    
    unsigned int q = half*c*(getDivMod((8*w),(pi*cd*dd*c))); //WD 32 BP -14
    q >>= 14; //WD 32
    
    cout << "The terminal velocity for a golf ball is: " << v << " ft/sec\n";
    cout << "The dynamic pressure is: " << q << " lb/ft^2\n";
    
    return 0;
}

