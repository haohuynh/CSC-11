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
 * @param R1
 * @return square root of R1
 */
unsigned int sqrt(unsigned int R1){
    
    unsigned int R0 = getDivMod(R1,2);
    
    unsigned int R2; 
    
    unsigned int R3 = 0x00000001; // WD 1 BP -1
      
    do{
        R2 = R0;
        R0 = getDivMod(R1,R2);
        R0 = R2 + R0;
        R0 = R3*R0;
        R0 >>= 1;
    }while (R0 != R2);
    
    return R0;
}

/*
 * Step 4:
 * Scaled integer with Newton's method and Div Mod function
 */
int main(int argc, char** argv) {
    
    unsigned int R1 = 0x019EB851; // w: WD 28 BP -28
    R1 = R1 * 8;
        
    unsigned int R3 = 0x000000C9; //pi: WD 8 BP -6
    unsigned int R0 = 0x00000001; // cd: WD 1 BP -1
    unsigned int R2 = R3 * R0; // R2 = pi*cd
    
    R3 = R2;
    R0 = 0x00000005; // dd: WD 8 BP -8  (d^2)
    R2 = R3 * R0; // R2 = pi*cd*dd
    
    R3 = R2;
    R0 = 0x0000004E; // c: WD 15 BP -15
    R2 = R3 * R0; // R2 = pi*cd*dd*c
    
    R0 = getDivMod(R1,R2); //v^2: (8*w)/(pi*cd*dd*c) 
    unsigned int stack = R0; //v^2: (8*w)/(pi*cd*dd*c)        
    R1 = R0;
    R0 = sqrt(R1); //v: WD 32 BP 1       
    R0 <<= 1; //v: WD 32        
    R1 = R0;
    cout << "The terminal velocity for a golf ball is: " << R1 << " ft/sec\n";
        
    R2 = stack; //v^2: (8*w)/(pi*cd*dd*c)   
    R0 = 0x00000001; // 0.5 : WD 1 BP -1
    R1 = R2 * R0; //0.5 * v^2
    
    R2 = R1;
    R0 = 0x0000004E; // c: WD 15 BP -15
    R1 = R2 * R0; //0.5 * v^2 * c : WD 32 BP -14
    R1 >>= 14; // q : WD 32
    cout << "The dynamic pressure is: " << R1 << " lb/ft^2\n";
    
    return 0;
}

