.global _start

result:		.space 4	//allocate space for result
dividend:	.word 80 	//arbitrary test value
divisor:	.word 8 	//arbitrary test value

_start:
	MOV a4, #0			//set value at quotient temp. reg. to 0
	LDR a3, =result		//load address of result word to r3
	LDR a1, dividend	//load divident value into a1
	LDR a2, divisor		//load divisor value into a2

LOOP:					//start loop
	CMP a1, a2			//compare to see if dividend - divisor < 0
	BLT END				//if so branch end, otherwise continue
	SUB a1, a1, a2		//store dividend - divisor in dividend reg.
	ADD a4, a4, #1		//increment quotient
	B LOOP				//go to loop start
END:
	LSL a4, a4, #16		//shift quotient to 16 MSBs
	ADD a4, a4, a1		//add remainder to 16 LSBs
	STR a4, [a3] 		//str value in a4 at address a3 points to
STOP:
	b STOP				//END PROGRAM
	