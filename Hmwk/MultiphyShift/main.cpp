/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on September 21, 2015, 6:40 PM
 */

#include <iostream>

using namespace std;

/*
 * Multiply Shift 
 */
int main(int argc, char** argv) {

    /**
     * Convert months to years  months->1 Byte, conversion->3 Bytes, Result->1 Byte then output years
     * months = 88
     */

    unsigned char R1 = 88; //BP 0 WD 7

    unsigned int R2 = 0x00155556; //BP -24 WD 24

    unsigned int R0 = R1 * R2; //BP -24 WD 31

    R0 >>= 24; //BP 0 WD 7

    cout << static_cast<int> (R0) << " " << endl;


    /**
     * 
     * Convert area to radius^2  area->1 Byte, conversion->3 Bytes, Result->1 Byte then output radius^2
     * area = 110
     */

    R1 = 110; //BP 0 WD 7

    R2 = 0x00517CC2; // BP-24 WD 24

    R0 = R1 * R2; // BP -24 WD 31

    R0 >>= 24; // BP 0 WD 7

    cout << static_cast<int> (R0) << " " << endl;


    /**
     *  Convert area to radius^2  area->2 Byte, conversion->2 Bytes, Result->1 Byte then output radius^2
     *  area 113.4
     *
     */

    unsigned short R3 = 0x7167; //BP -8 WD 15

    unsigned short R4 = 0x517D; //BP-16 WD 16

    R0 = R3 * R4; // BP -24 WD 31

    R0 >>= 24; // BP 0 WD 7

    cout << static_cast<int> (R0) << " " << endl;


    /**
     * Calculate area given the radius  radius->1 Byte, conversion->3 Bytes, Result->1 Byte then output area
     * radius=6 
     *
     */

    R1 = 36; // BP 0 WD 6 sqr(radius)

    R2 = 0x003243f7; // BP -20 WD 22
            
    R0 =  R1 * R2; // BP -20 WD 28
    
    R0 >>= 20; // BP 0 WD 8
            
    cout << static_cast<int> (R0) << " " << endl;
    
    
    /**
     * Calculate area given the radius  radius->2 Byte, conversion->2 Bytes, Result->1 Byte then output area
     * radius=6.5
     *    
     */
    
    R3 = 0x02A4; //BP -4 WD 10 sqr(radius)
    
    R4 = 0x3244; //BP -12 WD 14
    
    R0 = R3 * R4; //BP -16 WD 24
    
    R0 >>= 16; // BP 0 WD 8
    
    cout << static_cast<int> (R0) << " " << endl;
    
    return 0;
}

