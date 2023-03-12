.global _start
WHITE:		.word 0xFFFFFF
			.equ KBADD, 0xff200100
PIXELBUFF:	.word 0xc8000000
CHARBUFF:	.word 0xc9000000
input_maze_1:
            .word 2,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,0,0,1,1,1,0,0,0,1,1,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,0,0,0,0,0,3
input_maze_2:
            .word 2,1,0,1,1,1,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,0,0,1,1,1,0,0,0,1,0,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,1,0,0,0,0,3
input_maze_3:
            .word 2,0,0,0,0,1,0,0,0,1,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 1,1,0,1,1,1,1,1,1,1,1,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,1,0,0,0,3
input_maze_4:
            .word 2,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,1,0,1,0,1,0,1
            .word 0,1,0,1,0,1,1,1,0,1,0,1
            .word 0,0,0,1,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,1,0,1,0,0,0,1,0,0,0,1
            .word 0,1,0,1,1,1,0,1,0,1,1,1
            .word 0,1,0,1,0,0,0,0,0,0,0,3
input_maze_5:
            .word 2,0,0,0,0,1,0,1,0,1,0,1
            .word 1,1,0,1,1,1,0,1,0,1,0,1
            .word 0,0,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,1,0,1,0,1,0,0,0,1
            .word 1,1,0,1,1,1,0,1,1,1,0,1
            .word 0,0,0,1,0,1,0,0,0,0,0,1
            .word 0,1,0,1,0,1,0,1,0,1,1,1
            .word 0,1,0,0,0,1,0,1,0,0,0,3
input_maze_6:
            .word 2,0,0,0,0,0,0,1,0,0,0,1
            .word 1,1,0,1,0,1,0,1,0,1,0,1
            .word 0,0,0,1,0,1,0,0,0,1,0,1
            .word 1,1,1,1,0,1,1,1,1,1,1,1
            .word 0,0,0,1,0,0,0,1,0,0,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,0,0,1,0,3
input_maze_7:
            .word 2,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,0
            .word 1,1,1,1,1,0,1,1,1,0,1,1
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,0,1,0,1,0,1,0
            .word 1,0,1,0,0,0,1,0,1,0,1,0
            .word 1,1,1,1,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,0,0,1,3
input_maze_8:
            .word 2,0,0,0,0,0,0,0,0,0,0,0
            .word 1,0,1,1,1,1,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,1,0,0,0
            .word 1,1,1,1,1,0,1,1,1,1,1,1
            .word 1,0,0,0,1,0,1,0,0,0,0,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,0,1,1,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,3
input_maze_9:
            .word 2,0,0,0,0,0,1,0,1,0,1,0
            .word 1,0,1,1,1,1,1,0,1,0,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,1,1,0,1,1,1,1
            .word 1,0,1,0,1,0,1,0,0,0,1,0
            .word 1,0,1,1,1,0,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,1,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,3
			.equ KB_DATA, 0x0000CCCC
			.equ WAIT_AMOUNT, 0x400000
_start:

MAIN:
//clear screen for initialization
	bl VGA_clear_charbuff_ASM
	bl VGA_clear_pixelbuff_ASM
//initialize basic detail
	bl VGA_fill_ASM
	bl draw_grid_ASM
//poll kb for 1-9 input
	bl COURSE_POLL
	
//set starting coords of ampersand
	mov a1, #1
	mov a2, #1
//have 2 variable registers to store previous coords when moving
//i.e. scope of these value needs to be larger and their 
//continuity ensured
	mov v1, a1
	mov v2, a2
	
PLAY:
	push {a1, a2, lr}
	ldr a1, =KB_DATA
	bl read_PS2_data_ASM
	cmp a1, #1 //a1 is one if and only if a key has been pressed
	pop {a1, a2, lr}
	beq HANDLE_KB_PLAY
//win condition
	cmp v1, #12 //check if current square is end. If yes proceed to win screen
	cmpeq v2, #9
	push {lr}
	bleq result_ASM //WIN CONDITION!!!
	pop {lr}
	
	b PLAY

//branch here if input at all
//this subroutine checks if the input is a valid arrow key
//If yes, it sends the direction to the move subroutine
HANDLE_KB_PLAY:
//tough solution memory wise but does work in general
	push {a1, a2, lr}
	ldr a1, =KB_DATA
	bl read_PS2_data_ASM
	bl read_PS2_data_ASM
	bl read_PS2_data_ASM
	bl read_PS2_data_ASM //skips to the distinguishing value by clearning junk
	pop {a1, a2, lr}
	
	ldr a4, =KB_DATA
	ldr a4, [a4] //load the value where kb character stored
	and a4, #0xFF //isolate MAKE value
	push {lr}
	cmp a4, #0x75 //if up
	subeq a2, a2, #1
	bleq move_ASM
	cmp a4, #0x72 //if down
	addeq a2, a2, #1
	bleq move_ASM
	cmp a4, #0x6B //if left
	subeq a1, a1, #1
	bleq move_ASM
	cmp a4, #0x74 //if right
	addeq a1, a1, #1
	bleq move_ASM
	pop {lr}
	
	b PLAY
	
//when this function finishes,
result_ASM:
//initial clear screen
	bl VGA_clear_charbuff_ASM
	bl VGA_clear_pixelbuff_ASM
//set "YOU WIN :)"
//Y
	mov a1, #3
	mov a2, #3
	mov a3, #89
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//O
	mov a1, #4
	mov a2, #3
	mov a3, #79
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//U
	mov a1, #5
	mov a2, #3
	mov a3, #85
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
// 
	mov a1, #6
	mov a2, #3
	mov a3, #32
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//W
	mov a1, #7
	mov a2, #3
	mov a3, #87
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//I
	mov a1, #8
	mov a2, #3
	mov a3, #73
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//N
	mov a1, #9
	mov a2, #3
	mov a3, #78
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//
	mov a1, #10
	mov a2, #3
	mov a3, #32
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//:
	mov a1, #11
	mov a2, #3
	mov a3, #58
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//)
	mov a1, #12
	mov a2, #3
	mov a3, #41
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
//WAIT
	mov a1, #0
	ldr a2, =WAIT_AMOUNT
WAIT_LOOP:
	cmp a1, a2
	beq WAIT_LOOP_END
	add a1, a1, #1
	b WAIT_LOOP
WAIT_LOOP_END:
	b MAIN
	
	
COURSE_POLL:
//store kb data in
	ldr a1, =KB_DATA
	push {lr}
	bl read_PS2_data_ASM
	pop {lr}
	cmp a1, #1 //a1 is one if and only if a key has been pressed
	beq HANDLE_KB_MAP
	b COURSE_POLL
	 
HANDLE_KB_MAP:
	push {lr}
	bl read_PS2_data_ASM
	bl read_PS2_data_ASM //clears junk to get distinguishing value for keypress
	pop {lr}
	ldr a4, =KB_DATA
	ldr a4, [a4] //load the value where kb character stored
	and a4, #0xFF //isolate MAKE value
	push {lr}
	cmp a4, #0x16 //if 1
	//load maze 1
	ldreq a4, =input_maze_1 //pointer to start of bit matrix
	bleq fill_grid_ASM
	cmp a4, #0x1E //if 2
	//load maze 2
	ldreq a4, =input_maze_2
	bleq fill_grid_ASM
	cmp a4, #0x26 //if 3
	//load maze 3
	ldreq a4, =input_maze_3
	bleq fill_grid_ASM
	cmp a4, #0x25 //if 4
	//load maze 4
	ldreq a4, =input_maze_4
	bleq fill_grid_ASM
	cmp a4, #0x2E //if 5
	//load maze 5
	ldreq a4, =input_maze_5
	bleq fill_grid_ASM
	cmp a4, #0x36 //if 6
	//load maze 6
	ldreq a4, =input_maze_6
	bleq fill_grid_ASM
	cmp a4, #0x3D //if 7
	//load maze 7
	ldreq a4, =input_maze_7
	bleq fill_grid_ASM
	cmp a4, #0x3E //if 8
	//load maze 8
	ldreq a4, =input_maze_8
	bleq fill_grid_ASM
	cmp a4, #0x46 //if 9
	//load maze 9
	ldreq a4, =input_maze_9
	bleq fill_grid_ASM
	pop {lr}
	cmp a1, #0xCC	//branch to next step if a course was chosen
	bxeq lr
	
	b COURSE_POLL //otherwise branch back to course poll

//fills background to solid white (working)
//hardcoded i.e. takes no args
VGA_fill_ASM:
	mov a1, #0
	mov a2, #0
	mov a3, #0xFF
	//ldr a3, [a3] //loads value at address 0 which is hex for WHITE
LOOPXF:
	cmp a1, #320
	bge END_LOOPXF
LOOPYF:
	cmp a2, #240
	bge END_LOOPYF
	push {lr}
	bl VGA_draw_point_ASM
	pop {lr}
	add a2, a2, #1
	b LOOPYF
END_LOOPYF:
	mov a2, #0
	add a1, a1, #1
	b LOOPXF
END_LOOPXF:
	bx lr

//should work similarly to clear/fill
//but only fills with black under certain conditions
//pertaining to the grid specifications
//hardcoded
draw_grid_ASM:
	mov a1, #0		//x
	mov a2, #0		//y
	mov a3, #0 		//colour black for the grid lines
HORIZOZNTAL:
BORDERH1:
	push {lr}
	bl FILL_COLUMN		//fill row
	pop {lr}
	//cmp a1, #3
	cmp a1, #3
	beq MAIN_HORIZONTAL	//connector
	add a1, a1, #1 //increment
	b BORDERH1
	
MAIN_HORIZONTAL:
	add a1, a1, #21
	//cmp a1, #236
	ldr a4, =#288
	cmp a1, a4
	beq BORDERH2	//connector
	push {lr}
	bl FILL_COLUMN
	pop {lr}
	add a1, a1, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_COLUMN
	pop {lr}
	add a1, a1, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_COLUMN
	pop {lr}
	add a1, a1, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_COLUMN
	pop {lr}
	b MAIN_HORIZONTAL
	
BORDERH2:
	push {lr}
	bl FILL_COLUMN
	pop {lr}
	//cmp a1, #239
	ldr a4, =#319
	cmp a1, a4
	beq VERTICAL //connector
	add a1, a1, #1
	b BORDERH2

VERTICAL:
BORDERV1:
	//push {v2}
	push {lr}
	bl FILL_ROW		//fill row
	pop {lr}
	//cmp a2, #4
	cmp a2, #3
	beq MAIN_VERTICAL
	add a2, a2, #1 //increment
	b BORDERV1
	
MAIN_VERTICAL:
	add a2, a2, #21
	//ldr v2, =#315
	//cmp a2, v2
	cmp a2, #216
	beq BORDERV2
	push {lr}
	bl FILL_ROW
	pop {lr}
	add a2, a2, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_ROW
	pop {lr}
	add a2, a2, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_ROW
	pop {lr}
	add a2, a2, #1	//second subline since lines are two pixels wide
	push {lr}
	bl FILL_ROW
	pop {lr}
	b MAIN_VERTICAL

BORDERV2:
	//push {v2}
	push {lr}
	bl FILL_ROW
	pop {lr}
	//ldr v2, =#319
	//cmp a1, v2
	cmp a2, #239
	//pop {v2}
	bxeq lr		//terminate grid draw
	add a2, a2, #1
	b BORDERV2

//hardcode starting coordonates in centre of square (0, 0)
//which equates to real character coordonates (4, 4)
draw_AMPERSAND_ASM:
	//mov a1, #3
	//mov a2, #3
	mov a3, #38
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
	bx lr
	
//hardcode starting coordonates in centre of square (0, 0)
//which equates to real character coordonates (60 - 4, 80 - 4)
draw_exit_ASM:
	//mov a2, #51
	//mov a1, #69
	mov a3, #36
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
	bx lr
//same as fill subroutine but for each subsquare
//pass a1, a2, grid coords
//completes the mapping within the subroutine
draw_obstacles_ASM:
	push {a1, a2, a3, a4, v1, v2}
//transfer from grid coords to pixel coord
//note for this the coords are pointing
//to the top left of the square, and not
//the centre as with the character operations
//The formula is (x, y) grid -> ((x-1)(20)+(4x), (y-1)(20)+(4x)) = (x', y')
	sub a3, a1, #1
	sub a4, a2, #1
	
	mov v1, #20
	mul a3, a3, v1
	mul a4, a4, v1
	
	lsl a1, a1, #2
	lsl a2, a2, #2
	
	add a1, a1, a3 //final (x', y')
	add a2, a2, a4
//i.e. (1, 1) grid coords -> (4, 4)
//	   (2, 3) grid coords -> (28, 52)
//		and so on
	add v1, a1, #20	//calculate end coords for grid square
	add v2, a2, #20
	
	mov a4, a2
	mov a3, #0 //background colour
	

LOOPXG:
	cmp a1, v1
	bge END_LOOPXG
LOOPYG:
	cmp a2, v2
	bge END_LOOPYG
	push {a4, lr}
	bl VGA_draw_point_ASM
	pop {a4, lr}
	add a2, a2, #1
	b LOOPYG
END_LOOPYG:
	mov a2, a4
	add a1, a1, #1
	b LOOPXG
END_LOOPXG:
	pop {a1, a2, a3, a4, v1, v2}
	bx lr

//pass a4 as address of start of bit matrix
//for chosen maze
fill_grid_ASM:
//Hardcode start positoon of ampersand
	mov a1, #3
	mov a2, #3
	push {lr}
	bl draw_AMPERSAND_ASM
	pop {lr}
//Hardcode end position
	mov a2, #51
	mov a1, #69
	push {lr}
	bl draw_exit_ASM
	pop {lr}
//now consider input address to process input maze
//consider the fact that the start and end can not
//be anywhere on the map, although this modification could be
//simply made allowing for general 9x12 grid with 2 marking start, and 3 marking end.
//would require more robust processing checking for 2 and 3 within the matrix,
//as well as remebering and ensuring that there is, in fact, such start and end.
	
//thus action taken ONLY when value in bit matrix is 1
//coords of starting square
	mov a1, #1
	mov a2, #1
	//ldr a3, =#432 //finite length of all maze in bytes
	//add a3, a4, a3 //calculate end point for loop termination
GRID_LOOPX:
	cmp a2, #10
	beq GRID_LOOPX_END
GRID_LOOPY:
	cmp a1, #13
	beq GRID_LOOPY_END
	ldr a3, [a4] //load value at pointer
	cmp a3, #1
	push {lr}
	bleq draw_obstacles_ASM
	pop {lr}
	add a4, a4, #4 //increment pointer by one word - never resets
	add a1, a1, #1 //increment y coord
	b GRID_LOOPY
GRID_LOOPY_END:
	mov a1, #1
	add a2, a2, #1
	b GRID_LOOPX
	
GRID_LOOPX_END:
	mov a1, #0xCC //confirmation of grid draw return value
	bx lr
//pass (a1, a2) grid coords
//step 1 - check if move valid
//if yes, move ampersand to destination square
//update v1, v2 to current square
//otherwise set a1, a2, to v1, v2 (previous position)
move_ASM:
//check if legal
//check if out of bounds
	cmp a1, #0 
	ble FALSE_CASEM
	cmp a2, #0
	ble FALSE_CASEM
	cmp a1, #13
	bge	FALSE_CASEM
	cmp a2, #10
	bge FALSE_CASEM
//check if destination square at (a1, a2) is a wall
//this is done by reading the pixel buffer in the top left corner of the destination grid square
//if it is black => destination square is wall => proceed to false case
//otherwise proceed to true case
//with passed (a1, a2) call CHECK_WALL
	push {lr}
	bl CHECK_WALL
	pop {lr}
	cmp a3, #0 //if 1 means destination wall so proceed to false case
	beq FALSE_CASEM
//if the subroutine has proceeded to this point => destination square valid

TRUE_CASEM:
//if true do the actual move of the ampersand
//update v1, v2, with a1, a2
	push {lr}
	bl MOVE_CHARACTER
	pop {lr}
	mov v1, a1
	mov v2, a2
	cmp v2, #12 //check if current square is end. If yes proceed to win screen
	cmpeq v1, #9
	push {lr}
	bleq result_ASM //WIN CONDITION!!!
	pop {lr}
	bx lr
	
FALSE_CASEM:
//if false restore a1, a2 from v1, v2
	mov a1, v1
	mov a2, v2
	bx lr



MOVE_CHARACTER:
//convert grid coords to character coords to erase old position
	push {a1, a2, a3, a4, v1}
	sub a3, v1, #1
	sub a4, v2, #1
	
	mov a1, #6
	mul a3, a3, a1
	mul a4, a4, a1
	
	add a1, a3, #3 //final (x', y')
	add a2, a4, #3
	
	mov a3, #0 //mov null ascii to erase ampersand in old square
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
	pop {a1, a2, a3, a4, v1}
//(x, y) grid coords -> (6(x-1)+3, 6(y-1)+3)
	push {a1, a2, a3, a4, v1}
	sub a3, a1, #1
	sub a4, a2, #1
	
	mov v1, #6
	mul a3, a3, v1
	mul a4, a4, v1
	
	add a1, a3, #3 //final (x', y')
	add a2, a4, #3
	
	mov a3, #38 //mov ampersand to new square
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
	pop {a1, a2, a3, a4, v1}
//with the formatted character coords
	bx lr
CHECK_WALL:
//convert grid coords to pixel coords via scheme outline @
	push {a1, a2, a4} //callee save
	sub a3, a1, #1
	sub a4, a2, #1
	push {a1}
	mov a1, #20
	mul a3, a3, a1
	mul a4, a4, a1
	pop {a1}
	lsl a1, a1, #2
	lsl a2, a2, #2
	
	add a1, a1, a3 //final (x', y')
	add a2, a2, a4
//now that a1, a2 contain real pixel coords, destination square can be accessed
// as: address = ([PIXELBUFF] + (y << 10) + (x << 1))
	ldr a3, =PIXELBUFF
	ldr a3, [a3]
	lsl a1, #1
	lsl a2, #10
	orr a4, a1, a2 //formatted offset
	add a4, a3, a4 //final address of left corner of grid square
	ldrh a3, [a4] //load hex value of pixel colour
	cmp a3, #0 //check if black (i.e. hex 0)
	pop {a1, a2, a4}
	bx lr
	
	
VGA_draw_point_ASM:
	push {a1, a2, a3, v1, v2}
	ldr v1, =PIXELBUFF
	ldr v2, [v1]
	lsl a1, #1
	lsl a2, #10
	orr a4, a1, a2 //formatted offset
	add a4, a4, v2
	strh a3, [a4] //store input RGB at base+offset
	pop {a1, a2, a3, v1, v2}
	bx lr
	
VGA_clear_pixelbuff_ASM:
	mov a1, #0
	mov a2, #0
	mov a3, #0
LOOPX:
	cmp a1, #320
	bge END_LOOPX
LOOPY:
	cmp a2, #240
	bge END_LOOPY
	push {lr}
	bl VGA_draw_point_ASM
	pop {lr}
	add a2, a2, #1
	b LOOPY
END_LOOPY:
	mov a2, #0
	add a1, a1, #1
	b LOOPX
END_LOOPX:
	bx lr
	
VGA_clear_charbuff_ASM:
	mov a1, #0
	mov a2, #0
	mov a3, #0
LOOPX2:
	cmp a1, #80
	bge END_LOOPX2
LOOPY2:
	cmp a2, #60
	bge END_LOOPY2
	push {lr}
	bl VGA_write_char_ASM
	pop {lr}
	add a2, a2, #1
	b LOOPY2
END_LOOPY2:
	mov a2, #0
	add a1, a1, #1
	b LOOPX2
END_LOOPX2:
	bx lr

//passes a3 = hex code, at (a1, a2)
VGA_write_char_ASM:
	push {a1, a2, a3, a4, v1, v2}
	ldr v1, =CHARBUFF //load address from memory
	ldr v2, [v1]	//load charbuff reg at above
	lsl a2, #7	
	orr a4, a1, a2
	add a4, a4, v2
	strb a3, [a4]
	pop {a1, a2, a3, a4, v1, v2}
	bx lr
	
read_PS2_data_ASM:
	ldr a3, =KBADD	//load address of mem map kb reg
	ldr a2, [a3]
	lsr a4, a2, #15		//shift to access rvalid bit
	tst a4, #0x1	//extract bit and update cpsr
	
	//push {lr}
	bgt TRUE_CASE
	//pop {lr}
	
	tst a4, #0x1
	moveq a1, #0			//set output to 0 in false case
	bx lr
	
TRUE_CASE:
	strgtb a2, [a1]		//strb at input address
	movgt a1, #1		//set output to 1
	bx lr


//pass a2 (y coord) to this and fill for all x
FILL_ROW:
	push {a2, v2}
	mov a1, #0
//iterate for all y
ROW_LOOP:
	push {lr}
	bl VGA_draw_point_ASM
	pop {lr}
	ldr v2, =#319
	cmp a1, v2
	beq ROW_LOOP_END
	add a1, a1, #1
	b ROW_LOOP

ROW_LOOP_END:
	pop {a2, v2}
	bx lr

//pass a1 (x coord) to this and fill x for all y
FILL_COLUMN:
	push {a2}
	mov a2, #0
//iterate for all y
COLUMN_LOOP:
	push {lr}
	bl VGA_draw_point_ASM
	pop {lr}
	cmp a2, #237
	beq COLUMN_LOOP_END
	add a2, a2, #1
	b COLUMN_LOOP

COLUMN_LOOP_END:
	pop {a2}
	bx lr
	
	