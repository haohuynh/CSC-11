/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 2, 2015, 12:21 PM
 */

#include <cstdlib>
#include <iostream>
#include <cmath>
using namespace std;

/*
 * Step 3:
 * The regular scaled-integer terminal velocity program 
 */
int main(int argc, char** argv) {

    unsigned int w = 0x019EB851; // WD 28 BP -28
    unsigned int pi = 0x000000C9; // WD 8 BP -6
    unsigned int cd = 0x00000001; // WD 1 BP -1
    unsigned int dd = 0x00000005; // WD 8 BP -8  (d^2)
    unsigned int c = 0x0000004E; // WD 15 BP -15
    
    unsigned int half = 0x00000001; // WD 1 BP -1
    
    unsigned int v = sqrt((8*w)/(pi*cd*dd*c)); // WD 32 BP 1
    v <<= 1; //WD 32
    
    unsigned int q = half*c*((8*w)/(pi*cd*dd*c)); //WD 32 BP -14
    q >>= 14; //WD 32
    
    cout << "The terminal velocity for a golf ball is: " << v << " ft/sec\n";
    cout << "The dynamic pressure is: " << q << " lb/ft^2\n";
    
    return 0;
}

