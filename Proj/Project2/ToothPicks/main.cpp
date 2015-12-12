/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on December 12, 2015, 10:21 AM
 */

#include <cstdlib>
#include <iostream>
using namespace std;

/*
 * ToothPicks game 
 */
int main(int argc, char** argv) {

    /*
     * The minimum total of toothpicks
     */
    const int MIN_TOOTHPICKS = 23;

    /*
     * The minimum toothpicks that can be withdrawn at a times
     */
    const int MIN_WITHDRAW_TOOTHPICKS = 1;

    /*
     * The minimum toothpicks that can be withdrawn at a times* 
     */
    const int MAX_WITHDRAW_TOOTHPICKS = 3;

    /*
     * MIN_WITHDRAW_TOOTHPICKS + MAX_WITHDRAW_TOOTHPICKS
     */
    const int MAX_TOOTHPICKS_PARTITION = 4;

    /*
     * The current number of tooth picks
     */
    int crNbTPks = MIN_TOOTHPICKS;

    /*
     * The number of tooth picks that will be withdrawn 
     */
    int nWiTPks = 0;

    cout << "**********The game of ToothPicks!**********\n";

    cout << "Please enter the total number (greater than or equals to 23) of tooth picks for a game:";
    cin >> crNbTPks;
    
    if (crNbTPks < MIN_TOOTHPICKS){
        
        cout << "Reassigned the total to 23";
        crNbTPks = MIN_TOOTHPICKS;
        
    }
    
    while (true) {
        
        /* User's move */ 
_REINPUT:

        cout << "\nThe current toothpicks are: " << crNbTPks << "\n";
        cout << "Enter the number of toothpicks you want to withdraw (1 to 3): ";
        cin >> nWiTPks;

        if (nWiTPks < MIN_WITHDRAW_TOOTHPICKS){
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }
        
        if (nWiTPks > MAX_WITHDRAW_TOOTHPICKS){
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }
        
        if (nWiTPks > crNbTPks){
            cout << "Input error !!! Please do it again\n";
            goto _REINPUT;
        }
        
        //Accepted the move
        crNbTPks -= nWiTPks;
        
        // Verify result for user
        if (crNbTPks == MIN_WITHDRAW_TOOTHPICKS) {
            
            cout << "You win !!!";
            break;
            
        } else if (crNbTPks == 0) {
            
            cout << "You lose!";
            break;
            
        }

        // Computer's move
        if (crNbTPks > MAX_TOOTHPICKS_PARTITION) {

            cout << "Computer withdraws: " << (MAX_TOOTHPICKS_PARTITION - nWiTPks)
                    << " toothpicks\n";
            crNbTPks -= (MAX_TOOTHPICKS_PARTITION - nWiTPks);

        } else {
            
            cout << "Computer withdraws: " << (crNbTPks - MIN_WITHDRAW_TOOTHPICKS)
                    << " toothpicks\n";
            cout << "You lose !";
            break;
            
        }

    }

    return 0;
}

