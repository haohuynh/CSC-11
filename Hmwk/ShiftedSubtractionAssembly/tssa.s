/* Author: Dr. Mark E. Lehr
 * Created on September 20, 2015, 3:52 PM
 * Purpose: Division and Mod operator */

.global main
main:

    /*Set up the Registers*/
    LDR R4,=6  @Denominator INPUT
    LDR R5,=55 @Numerator   INPUT
    MOV R0,R5  @R5%R4       OUTPUT
    MOV R1,#0  @R5/R4       OUTPUT
    MOV R2,#1  @Factor      WORKING
    MOV R3,R4  @Decrement   WORKING

    /*Shift the denominator left by 2 until greater,
                                    then shift back*/
    _while_R0_gt_R3:
        LSL R3,#1 @R3<<=1
        LSL R2,#1 @R2<<=1
    CMP R0,R3
    BGT _while_R0_gt_R3
    LSR R3,#1 @R3>>=1
    LSR R2,#1 @R2>>=1;

    /*Loop and keep subtracting off the shifted denominator*/
    _while_R0_gte_R3:
    CMP R0,R3
    BLT _output
        ADD R1,R1,R2 @R1+=R2
        SUB R0,R0,R3 @R0-=R3

        /*Shift right until denominator is less than numerator*/
        _while_R2_gt_1:
        CMP R2,#1
        BLE _while_R0_gte_R3
            LSR R2,#1 @R2>>=1
            LSR R3,#1 @R3>>=1
        BAL _while_R2_gt_1
    BAL _while_R0_gte_R3

    /*Prepare for output*/
    _output:
    MOV R1,R0
    bx lr
	