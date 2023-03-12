.global _start
//display register locations
H03:	.word 0xFF200020
H45:	.word 0xFF200030
//PB register locations
DATA:	.word 0xFF200050
INTM:	.word 0xFF200058
EDGE:	.word 0xFF20005C
//switch and LED register locations
		.equ SW_MEMORY, 0xFF200040
		.equ LED_MEMORY, 0xFF200000
//display character code lut
		.equ zero, 0x3F
		.equ one, 0x06
		.equ two, 0x5B
		.equ three, 0x4F
		.equ four, 0x66
		.equ five, 0x6D
		.equ six, 0x7D
		.equ seven, 0x07
		.equ eight, 0x7F
		.equ nine, 0x6F
		.equ A, 0x77
		.equ b, 0x7C
		.equ c, 0x39
		.equ d, 0x5E
		.equ E, 0x79
		.equ F, 0x71
_start:

MAIN1:
//clear
	mov a1, #0x3f
	push {lr}
	bl HEX_CLEAR_ASM
	bl PB_CLEAR_EDGECP_ASM
	pop {lr}
//run switch to LED loop
//and poll edge bits
SWITCH_LED_LOOP:
	push {lr}
	bl READ_SLIDER_SWITCHES_ASM
	pop {lr}
	mov a4, a1 //storing integer value for later use
	push {lr}
	bl WRITE_LEDS_ASM
	pop {lr}
	mov a2, a1
//check if edge fall
	push {lr}
	bl PB_EDGECP_IS_PRESSED_ASM
	pop {lr}
	cmp a1, #1
	pusheq {lr}
	moveq a1, a4
	bleq READ_PB_EDGECP_ASM
	bleq SET_DISPLAY
	b SWITCH_LED_LOOP
SET_DISPLAY:
//fill display 4, 5 before each set
	push {a1}
	mov a1, #0x30
	push {lr}
	bl HEX_FLOOD_ASM
	pop {lr}
	pop {a1}
//clear case
	tst a1, #0x200
	pushgt {a1}
	movgt a1, #0x7F
	pushgt {lr}
	blgt HEX_CLEAR_ASM
	popgt {lr}
	popgt {a1}
	//add zero egde bits here
	bxgt lr //leave in this case
//general case
	push {lr}
	bl HEX_WRITE_ASM
	pop {lr}
	bx lr

END1:
	b END1
MAIN2:
//clear
	mov a1, #0x3F
	bl HEX_CLEAR_ASM
POLL:
//read the switches to get integer value
	bl READ_SLIDER_SWITCHES_ASM
//map switches to the LEDs
	bl WRITE_LEDS_ASM
//switch value still in a1
	mov a2, a1 //integer value
	bl READ_PB_EDGECP_ASM
	mov a3, a1 //pb indeces
	//set a1 to 1 if PB pressed
	bl PB_EDGECP_IS_PRESSED_ASM
//clear case
	cmp a1, #0x1
	tsteq a2, #0x200
	pushgt {a1}
	movgt a1, #0x30 //value to flood H4 and H5
	blgt HEX_FLOOD_ASM
	popgt {a1}
//if a1 1 then there was a falling edge of PB
//get pb indeces and make changes to displays
	cmp a1, #0x1
	mov a1, a3
	bleq HEX_WRITE_ASM
	
	b POLL

END2:
	b END2
//Switch Driver Subroutine
READ_SLIDER_SWITCHES_ASM:
	ldr a2, =SW_MEMORY
	ldr a1, [a2]
	bx lr

//LED driver Subroutine
WRITE_LEDS_ASM:
	ldr a2, =LED_MEMORY
	str a1, [a2]
	bx lr	

//takes displays to clear as input a1
//hex value where positional ones
//encode the displays to act on
HEX_CLEAR_ASM:
//determine which displays to change
//as series of if statements

//load address for display 0-3
	ldr a2, H03
//H0
	tst a1, #0x1
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	add a2, a2, #1

//H1
	tst a1, #0x2
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	add a2, a2, #1

//H2
	tst a1, #0x4
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	add a2, a2, #1
	
//H3
	tst a1, #0x8
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	add a2, a2, #1
	
//load address for display 4-5
	ldr a2, H45
	
//H4
	tst a1, #0x10
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	add a2, a2, #1

//H5
	tst a1, #0x20
	pushgt {lr}
	blgt CLEAR
	popgt {lr}
	
	bx lr

//takes no input but relies on a3
//updated properly
CLEAR:
	mov a3, #0
	strb a3, [a2]
	bx lr

	
//takes displays to flood as input a1
//hex value where positional ones
//encode the displays to act on
HEX_FLOOD_ASM:
//determine which displays to change
//as series of if statements

//load address for display 0-3
	ldr a2, H03
//H0
	tst a1, #0x1
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	add a2, a2, #1

//H1
	tst a1, #0x2
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	add a2, a2, #1

//H2
	tst a1, #0x4
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	add a2, a2, #1
	
//H3
	tst a1, #0x8
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	add a2, a2, #1
	
//load address for display 4-5
	ldr a2, H45
	
//H4
	tst a1, #0x10
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	add a2, a2, #1

//H5
	tst a1, #0x20
	pushgt {lr}
	blgt FLOOD
	popgt {lr}
	
	bx lr

//takes no input but relies on a3
//updated properly
FLOOD:
	mov a3, #0x7F
	strb a3, [a2]
	bx lr

//takes in display indeces in a1
//takes in integer to display in a2
HEX_WRITE_ASM:
//figure out positional hex equivalents

//First, find the display code corresponding to integer in a2
//Use a set of conditionals to compare and get the correct value
//pass this value into a2 once finished to move forward

//0
	cmp a2, #0
	moveq a2, #zero	
//1
	cmp a2, #1
	moveq a2, #one
//2
	cmp a2, #2
	moveq a2, #two
//3
	cmp a2, #3
	moveq a2, #three
//4
	cmp a2, #4
	moveq a2, #four
//5
	cmp a2, #5
	moveq a2, #five
//6
	cmp a2, #6
	moveq a2, #six
//7
	cmp a2, #7
	moveq a2, #seven
//8
	cmp a2, #8
	moveq a2, #eight 
//9
	cmp a2, #9
	moveq a2, #nine
//A
	cmp a2, #10
	moveq a2, #A
//b
	cmp a2, #11
	moveq a2, #b
//c
	cmp a2, #12
	moveq a2, #c
//d
	cmp a2, #13
	moveq a2, #d
//E
	cmp a2, #14
	moveq a2, #E
//F
	cmp a2, #15
	moveq a2, #F
	
//Now the the correct display code corresponding to the
//input integer value is stored in register a2, proceed
//as before to find the display to be updated

//load address for display 0-3
	ldr a3, H03
//H0
	tst a1, #0x1
	pushgt {lr}
	blgt SET
	popgt {lr}
	add a3, a3, #1

//H1
	tst a1, #0x2
	pushgt {lr}
	blgt SET
	popgt {lr}
	add a3, a3, #1

//H2
	tst a1, #0x4
	pushgt {lr}
	blgt SET
	popgt {lr}
	add a3, a3, #1
	
//H3
	tst a1, #0x8
	pushgt {lr}
	blgt SET
	popgt {lr}
	add a3, a3, #1
	
//load address for display 4-5
	ldr a3, H45
	
//H4
	tst a1, #0x10
	pushgt {lr}
	blgt SET
	popgt {lr}
	add a3, a3, #1

//H5
	tst a1, #0x20
	pushgt {lr}
	blgt SET
	popgt {lr}

//terminate
	bx lr
	
//takes a2 input as display code to pass
//into hex data register
//relies on a3 be updated accordingly 	
SET:
	strb a2, [a3]
	bx lr
	
//takes PB index in a1
//returns 0x1 if input PB pressed is true in a1
PB_DATA_IS_PRESSED_ASM:
	ldr a3, =DATA
	//ldr a2, [a3]
//logical and of input and the data reg 
//returns greater than 0 if and only if
//e of the push buttons is pressed
	tst a1, a3
	movgt a1, #0x1
	movle a1, #0
	bx lr
	
//returns the value of edgecap register in a1
//which stores the indeces of the pressed then released PBs
READ_PB_EDGECP_ASM:
	ldr a2, =EDGE
	//ldr a2, [a2]
	bx lr
	
//takes PB index in a1
//returns 0x1 if input PB pressed and released is true in a1
PB_EDGECP_IS_PRESSED_ASM:
	ldr a3, =EDGE
	//ldr a2, [a3]
//logical and of input and the EDGE 
//returns greater than 0 if and only if
//e of the push buttons is pressed
	tst a1, a2
	movgt a1, #0x1
	bx lr

//reading EDGE, then writing read value
//clears the EDGECP reg.
PB_CLEAR_EDGECP_ASM:
	ldr a3, =EDGE
	//ldr a2, [a3]
	str a2, [a3]
	bx lr

//takes PB indeces a1
//sets INT MASK at corresponding bits
ENABLE_PB_INT_ASM:
//0
	tst a1, #1
	addge a3, #1
//1
	tst a1, #2
	addge a3, #2
//2
	tst a1, #4
	addge a3, #4
//3
	tst a1, #8
	addge a3, #8
//set the value at INTM as encoded display indeces
//which are one 
	str a3, INTM
	bx lr

//takes PB indeces a1
//disables INT Mask at corresponding bits
DISABLE_PB_INT_ASM:
	ldr a2, =INTM
//0
	tst a1, #1
	tstgt a2, #1
	subgt a2, #1
//1
	tst a1, #2
	tstgt a2, #2
	subgt a2, #2
//2
	tst a1, #4
	tstgt a2, #4
	subgt a2, #4
//3
	tst a1, #8
	tstgt a2, #8
	subgt a2, #8
	bx lr
