/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 2, 2015, 12:06 PM
 */

#include <cstdlib>
#include <cmath>
#include <iostream>
using namespace std;

/*
 * Step 2:
 * The regular terminal velocity program
 */
int main(int argc, char** argv) {
    
    float d = 0.14;
    float w = 0.10125;
    float cd = 0.5;
    float c = 0.0023769;
    float pi = 3.141592654;
    double v = sqrt ((8*w)/(pi*c*d*d*cd));
    double q = 0.5*c*v*v;
        
    cout << "The terminal velocity for a golf ball is: " << v << " ft/sec\n";
    cout << "The dynamic pressure is: " << q << " lb/ft^2\n";
    
    return 0;
}

