/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 3, 2015, 6:00 PM
 */

#include <cstdlib>
#include <cmath>
#include <iostream>
using namespace std;

/*
 * Step 6:
 * Using Floating Point microprocessor to solve for Terminal Velocity
 */
int main(int argc, char** argv) {

    float dd = 0.0196; 
    float w = 0.10125;
    float cd = 0.5;
    float c = 0.0023769;
    float pi = 3.141592654;
    float half = 0.5;
    
    float s0 = 8;
    float s1 = w;
    float s2 = s0 * s1; //8w
    
    s0 = pi;
    s1 = c; 
    float s3 = s0* s1; //pi*c
    
    s0 = s3;
    s1 = dd;
    s3 = s0 * s1;//pi*c*d*d
    
    s0 = s3;
    s1 = cd;
    s3 = s0 * s1; //pi*c*d*d*cd
    
    s1 = s2/s3; //(8*w)/(pi*c*d*d*cd)
    float stack = s1;        
            
    s0 = sqrt (s1);
    double d0 = s0;  
    cout << "The terminal velocity for a golf ball is: " << d0 << " ft/sec\n";
    
    s1 = stack;
    s0 = c;
    s2 = s0 * s1;
    s1 = half;
    s0 = s1*s2;
    
    d0 = s0;
        
    
    cout << "The dynamic pressure is: " << d0 << " lb/ft^2\n";
    
    return 0;
    
    return 0;
}

