/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on October 5, 2015, 11:44 AM
 */

#include <iostream>

using namespace std;

/*
 * Assembly Loops and Branchings
 */
int main(int argc, char** argv) {

    int R1 = 10; // The number of elements in a array that needs summing
    int R2 = 1; // The counter
    int R0 = 0; // The result

    //While Loop - Start 
    while (R2 <= R1) {
        R0 += R2;
        R2++;
    }
    cout << R0 << endl;
    //While Loop - End;


    //Do While Loop - Start 
    R2 = 1;
    R0 = 0;
    do {
        R0 += R2;
        R2++;
    } while (R2 <= R1);
    cout << R0 << endl;
    //Do While Loop - End;


    //For Loop - Start 
    R0 = 0;
    for (R2 = 1; R2 <= R1; R2++) {
        R0 += R2;
    }
    cout << R0 << endl;
    //For Loop - End


    // If Branching - Start
    R1 = 5; // Input: {Mon-Fri} ~ {1-5}
    R0 = 0; // Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

    if (R1 == 1 || R1 == 3) {
        R0 = 11;
    }

    if (R1 == 2 || R1 == 4) {
        R0 = 5;
    }

    if (R1 == 5) {
        R0 = 1;
    }
    cout << R0 << endl;
    // If Branching - End


    // If Else - Start
    R1 = 1; // Input: {Mon-Fri} ~ {1-5}
    R0 = 0; // Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

    if (R1 == 1 || R1 == 3) {
        R0 = 11;
    } else if (R1 == 2 || R1 == 4) {
        R0 = 5;
    } else if (R1 == 5) {
        R0 = 1;
    }
    cout << R0 << endl;
    // If Else - End


    // Switch - Start
    R1 = 2; // Input: {Mon-Fri} ~ {1-5}
    R0 = 0; // Output: A Subject {CSC11, CSC5, CIS1A, OTHERS} ~ {11,55,1,0}

    switch (R1) {
        case 1:case 3:
        {
            R0 = 11;
            break;
        }
        case 2: case 4:
        {
            R0 = 5;
            break;
        }
        case 5:
        {
            R0 = 1;
        }
    }

    cout << R0 << endl;
    // Switch - End


    return 0;
}

