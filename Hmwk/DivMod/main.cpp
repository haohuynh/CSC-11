/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on September 23, 2015, 10:46 PM
 */

#include <iostream>

using namespace std;

/*
 * This program 
 * uses a (1 to 4) Byte integer as the numerator 
 * and a (1 to 4) Byte integer as the denominator.
 * Then, it applies subtraction and loops only
 * to output numerator/denominator example 16/3 = 5 
 * and to output numerator%denominator example 16%3 = 1.
 */
int main(int argc, char** argv) {

    int numerator = 16;
    
    int denominator = 3;
    
    int quotient = 0;
    
    while (numerator >= denominator){
        numerator -= denominator;
        quotient++;
    }
    
    cout << "The quotient of 16\3 is: " << quotient << endl;
    cout << "The reminder is: " << numerator;
        
    return 0;
}

