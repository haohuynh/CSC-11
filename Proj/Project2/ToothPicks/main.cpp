/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 12, 2015, 10:21 AM
 */

#include <cstdlib>
#include <iostream>
using namespace std;

/**
 * Div/Mod by the multiply shifted method 
 * @param R1 : The numerator
 * @param R2 : The denominator
 * @return The remainder
 */
unsigned int getMod(unsigned int R1, unsigned int R2) {

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
        } else {
            break;
        }


    } while (true);

    return R1;
}

/**
 * This function calculates the number of tooth picks that will be withdrawn by a computer
 * @param crNTP : current number of the tooth pick
 * @return the number of tooth picks that computer should withdraw
 */
int calWTPForComputer(int crNTP) {

    int R1 = getMod(crNTP, 4);

    //A move that makes a potential win 
    if (R1 == 0) {
        return 3;
    }

    //A move that makes a potential lose
    if (R1 == 1) {
        return 1;
    }

    //A move that makes a potential win 
    if (R1 == 2) {
        return 1;
    }

    //A move that makes a potential win 
    return 2;
}

/*
 * ToothPicks game 
 */
int main(int argc, char** argv) {

    /*
     * The minimum total of toothpicks
     */
    const int MIN_TOTAL_TOOTHPICK = 23;

    /*
     * The minimum toothpicks that can be withdrawn at a times
     */
    const int MIN_WITHDRAW_TOOTHPICK = 1;

    /*
     * The minimum toothpicks that can be withdrawn at a times* 
     */
    const int MAX_WITHDRAW_TOOTHPICK = 3;

    /*
     * MIN_WITHDRAW_TOOTHPICKS + MAX_WITHDRAW_TOOTHPICKS
     */
    const int TOOTH_PICK_PARTITION = 4;

    /*
     * The current number of tooth picks
     */
    int crNbTPks;

    /*
     * The number of tooth picks that will be withdrawn by a player
     */
    int nWiTPks;

    /*
     * The number of tooth picks that will be withdrawn by a computer
     */
    int nWiTPkC;

    /*
     * A player's request to continue on the game
     */
    char plyRqt;

_restart:

    cout << "\n\n**********The game of ToothPicks!**********\n";

    cout << "Please enter the total number (>= 23) of tooth picks for a game:";
    cin >> crNbTPks;

    if (crNbTPks < MIN_TOTAL_TOOTHPICK) {

        cout << "Reassigned the total to 23";
        crNbTPks = MIN_TOTAL_TOOTHPICK;

    }

    while (true) {

        /* User's move */
_REINPUT:

        cout << "\nThe current toothpicks are: " << crNbTPks << "\n";
        cout << "Please enter the number of toothpicks you want to withdraw (1 to 3): ";
        cin >> nWiTPks;

        if (nWiTPks < MIN_WITHDRAW_TOOTHPICK) {
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }

        if (nWiTPks > MAX_WITHDRAW_TOOTHPICK) {
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }

        if (nWiTPks > crNbTPks) {
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }

        //Accepted the move
        crNbTPks -= nWiTPks;

        // Verify result for user
        if (crNbTPks == MIN_WITHDRAW_TOOTHPICK) {

            cout << "You win !!!";
            break;

        }

        if (crNbTPks == 0) {

            cout << "You lose!";
            break;

        }

        // Computer's move
        if (crNbTPks > TOOTH_PICK_PARTITION) {

            nWiTPkC = calWTPForComputer(crNbTPks);

            cout << "Computer withdraws: " << nWiTPkC
                    << " toothpicks\n";

            crNbTPks -= nWiTPkC;

        } else {

            nWiTPkC = (crNbTPks - MIN_WITHDRAW_TOOTHPICK);

            cout << "Computer withdraws: " << nWiTPkC
                    << " toothpicks\n";
            cout << "You lose !";

            break;

        }

    }

    cout << "\nWould you like to continues (y or n)? ";
    cin >> plyRqt;

    if (plyRqt == 'y') {
        goto _restart;
    }

    return 0;
}

