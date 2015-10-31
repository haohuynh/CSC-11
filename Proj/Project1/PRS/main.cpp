/* 
 * File:   main.cpp
 * Author: HaoHuynh
 *
 * Created on October 23, 2015, 4:21 PM
 */

#include <cstdlib>
#include <iostream>
#include <termios.h>
#include <unistd.h>

using namespace std;

enum PRS {
    PAPER = 1, ROCK = 2, SCISSORS = 3
};

const string FIRST_RULE = "Paper covers rock";

const string SECOND_RULE = "Rock break scissors";

const string THIRD_RULE = "Scissors cut paper";

const string FINAL_RULE = "A tie!";

const int MAX_NUMBER_OF_CHOICES = 3;

/*
 * Generate a random paper, rock, or scissors
 */
PRS getARandomChoice() {

    int aRandomChoice = (rand() % MAX_NUMBER_OF_CHOICES) + 1;

    switch (aRandomChoice) {

        case 1: return PAPER;
        case 2: return ROCK;
        default: return SCISSORS;

    }

}

/**
 * Display a player's choice by name
 * @param prs
 */
void displayPRS(PRS prs) {

    if (prs == PAPER) {
        cout << "Paper\n";
    } else if (prs == ROCK) {
        cout << "Rock\n";
    } else {
        cout << "Scissors\n";
    }
}

/**
 * 
 * @param formerChoice
 * @param latterChoice
 * @param ruleName
 * @return if the former choice is the winner
 */
bool isTheFormerWin(PRS formerChoice, PRS latterChoice) {

    if (formerChoice == PAPER) {
        if (latterChoice == ROCK) {
            cout << "Apply rule: " << FIRST_RULE << endl;
            return true;
        }
    }

    if (formerChoice == ROCK) {
        if (latterChoice == SCISSORS) {
            cout << "Apply rule: " << SECOND_RULE << endl;
            return true;
        }

    }

    if (formerChoice == SCISSORS) {
        if (latterChoice == PAPER) {
            cout << "Apply rule: " << THIRD_RULE << endl;
            return true;
        }
    }

    return false;
}

/*
 * Decide who wins the game
 */
void findTheWiner(PRS firstPlayerChoice, PRS secondPlayerChoice) {

    if (isTheFormerWin(firstPlayerChoice, secondPlayerChoice)) {

        cout << "The winner is the first player.\n";

    } else if (isTheFormerWin(secondPlayerChoice, firstPlayerChoice)) {

        cout << "The winner is the second player.\n";

    } else {
        cout << FINAL_RULE << endl;
    }

}

/*
 * Used for 2 human players
 */
void processForHumanVsComputer() {

    int firstPlayerChoice;

    int secondPlayerChoice;

    cout << "Please enter your choice (1 = Paper, 2 = Rock  or 3 = Scissor):\n";
    cin >> firstPlayerChoice;

    secondPlayerChoice = getARandomChoice();
    cout << "The computer choice is ";
    displayPRS(static_cast<PRS> (secondPlayerChoice));

    findTheWiner(static_cast<PRS> (firstPlayerChoice), static_cast<PRS> (secondPlayerChoice));
}

/*
 * Used for 2 computer bots
 */
void processForComputerBots() {

    int firstPlayerChoice;

    int secondPlayerChoice;

    cout << endl;

    firstPlayerChoice = getARandomChoice();
    cout << "The first player's choice is ";
    displayPRS(static_cast<PRS> (firstPlayerChoice));

    secondPlayerChoice = getARandomChoice();
    cout << "The second player's choice is ";
    displayPRS(static_cast<PRS> (secondPlayerChoice));

    findTheWiner(static_cast<PRS> (firstPlayerChoice), static_cast<PRS> (secondPlayerChoice));
}

/*
 * Name: Hao Huynh
 * Student ID: 2493814
 * Date: 09/30/2014
 * HW:5 Exercise 4
 * Problem: Rock - Paper - Scissor : Human Players or Computer Bots
 * I certify this is my own work and code
 */
int main(int argc, char** argv) {

    const int PLAYER_OPTION = 1;

    const int COMPUTER_OPTION = 2;

    string result;

    int option;

    srand(time(NULL));

    cout << "**********The Paper-Rock-Scissor game**********\n ";
    cout << FIRST_RULE << ".\n "
            << SECOND_RULE << ".\n "
            << THIRD_RULE << ".\n "
            << FINAL_RULE << "\n";

    do {

        cout << "\nSelecting an option for playing the game:\n";
        cout << "1.Human Player vs Computer Bot\n";
        cout << "2.Two Computer Bots\n";
        cin >> option;

        switch (option) {
            case PLAYER_OPTION:
            {
                processForHumanVsComputer();
                break;
            }
            case COMPUTER_OPTION:
            {
                processForComputerBots();
            }
        }
        
        cout << "You want to replay Paper-Rock-Scissor game (Y/N) ?";
        cin >> result;

    } while (!result.compare("Y") || !result.compare("y"));

    return 0;
}