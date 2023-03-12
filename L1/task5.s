.global _start

input_image: 		.word 1057442138,  2410420899, 519339369,  2908788659, 1532551093, 4249151175, 4148718620, 788746931,  3777110853, 2023451652
				.word 3000595192,   1424215634, 3130581119, 3415585405, 2359913843, 1600975764, 1368061213, 2330908780, 3460755284, 464067332
				.word 2358850436,   1191202723, 2461113486, 3373356749, 3070515869, 4219460496, 1464115644, 3200205016, 1316921258, 143509283
				.word 3846979011,   2393794600, 618297079,  2016233561, 3509496510, 1966263545, 568123240,  4091698540, 2472059715, 2420085477
				.word 395970857,    2217766702, 44993357,   694287440,  2233438483, 1231031852, 2612978931, 1464238350, 3373257252, 2418760426
				.word 4005861356,   288491815, 3533591053,  754133199,  3745088714, 2711399263, 2291899825, 2117953337, 1710526325, 1989628126
				.word 465096977,    3100163617, 195551247,  3884399959, 422483884,  2154571543, 3380017320, 380355875,  4161422042, 654077379
				.word 2168260534,   3266157063, 3870711524, 2809320128, 3980588369, 2342816349, 1283915395, 122534782,  4270863000, 2232709752
				.word 1946888581,   1956399250, 3892336886, 1456853217, 3602595147, 1756931089, 858680934,  2326906362, 2258756188, 1125912976
				.word 1883735002,   1851212965, 3925218056, 2270198189, 3481512846, 1685364533, 1411965810, 3850049461, 3023321890, 2815055881		

imageOut:		.word 0, 0, 0, 0, 0		//output image set to zeros for later addition of channel medians
				.word 0, 0, 0, 0, 0		//for use in MEDIAN_FILTER subroutine
				.word 0, 0, 0, 0, 0
				.word 0, 0, 0, 0, 0
				.word 0, 0, 0, 0, 0

sortingArray: 	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 	//space for sorting array

_start:
	
MAIN:

	ldr a1, =input_image 	// pointer to first pixel word
	push {lr}
	bl MEDIAN_FILTER
	pop {lr}
	
	

STOP:
	b STOP


//a1 param is the pointer to the first pixel
MEDIAN_FILTER:
	push {a1-v1}					//callee-save
	
	mov v1, #0
//little endian so channel order is a, b, g, r
CHANNEL_LOOP:
	cmp v1, #3
	bgt CHANNEL_LOOP_END
	add a2, a1, v1			//changing the address by channel offset to load the BYTE with channel infor for proptional offset
	push {lr}
	bl MEDIAN_FILTER_SINGLE_CHANNEL //a1 -> first pixel address
	pop {lr}
	add v1, v1, #1			//increment channel index
	
CHANNEL_LOOP_END:
	pop {a1-v1} 					//calle-save
	bx lr					//end of 

//a1 param is address of first pixel to read
MEDIAN_FILTER_SINGLE_CHANNEL:
	push {a1-v8}					//callee-save
	mov a3, #0						//offset
	ldr v8, =imageOut
SQUARE_LOOP:
	//can proceed immediately into first subsquare
	//input values are true for first iteration
	//this loop calculates a2, a3 for the first pixel in subsquare and should
	//not be altered in the subsquare loop
	mov v3, #0				//storage array index
	mov v1, a2				//create alterable registers
	mov v2, a3				// ||
	ldr a4, =sortingArray 	//pointer to start of sorting array
	mov v4, #0				//row counter (can't find meaningful way to do this with addresses)
	mov v7, a2				//output offset counter
SUBSQUARE_LOOP:
	//bruh moment
	ldrb v5, [v1, v2]
	strb v5, [v3, a4]
	//end lines
	add v2, v2, #4			//increment subsquare offset
	cmp v2, #20				//check if at end of row
	ble SUBSQUARE_LOOP		//if not, loop
	mov v2, #0				//reset offset for new row
	add v1, v1, #40			//move pointer to start of next row
	add v4, v4, #1			//increment the row counter
	cmp v4, #4				//check if address is on the last row
	ble SUBSQUARE_LOOP		//if not, loop
	
SUBSQUARE_LOOP_END:
	push {lr}
	bl INSERTION_SORT		//sort subsquare array
	pop {lr}
	mov v6, #13				//get offset for element 13
	lsl v6, v6, #2			//get byte value
	ldrb v6, [a4, v6]		//load value at index 13 in array (median value)
	strb v6, [v8, v7]				//store it at its respective position in the output image
	add v7, v7, #4
	//push{lr}
	//bl MEDIAN_STORE			//find the median
	//pop	{lr}
	//end lines
	add a3, a3, #4			//increment offset
	cmp a3, #20 			//check to see if address offset is at the end of the row
	ble SQUARE_LOOP 		//if not, then loop again
	mov a3, #0 				//if not will pass onto the offset reset for new row
	add a2, a2, #40 		//increment pointer to start of next row
	cmp a2, #200 			//check if address is on the last row
	ble SQUARE_LOOP			//if not, loop
	//if both false i.e. at end of row and end of column, then head out
	//no need to branch out, just dont branch back
SQUARE_LOOP_END:
//final returns etc
	pop {a1-v8}				//callee-save
	
	bx lr
	
//head of array param is in a4
//MEDIAN_STORE:
//	push {a1-}					//callee-save
	
	
//inplace so will alter the given array directly
INSERTION_SORT:
	push {a1-v4}					//callee-save
	//ldr a1, =arr			//load pointer to head of array (dont need when a subroutine)
	mov a2, #25				//load length of the array
	mov a3, #0				//load index i to start
FORLOOP:
	cmp a2, a3				//make initial comparison to see if loop or not
	ble ENDFOR				//leave loop if n-i <= 0, n <= i
	lsl a4, a3, #2			//calculate offset wrt to i (for arr[i] calc.) (in bits)
	ldr v1, [a1, a4]		//load the element of the array offset by a4 = i*4
	mov v2, a3				//set j=i 
	
WHILELOOP:
	lsls a4, v2, #2			//calculate offset j -> need to do every round for relative accuracy (update status bits)
	subgt v3, a4, #4 		//calculate offset j-1 (conditional a4 non-zero)
	ldr v4, [a1, v3]		//load the element of the array offset by v3 = i*4-4, i = j
	cmp v2, #0				//see if j-0 <= 0, or j <= 0
	ble ENDWHILE			//if above true branch end of while
	cmp v4, v1				//see if arr[j-1] - arr[i] <= 0, or arr[j-1] <= arr[i]
	ble ENDWHILE			//if above true branch to end of while
	str v4, [a4]			//store value in v4 = arr[j-1] at address of arr[j] = offset j from 0
	
	sub v2, v2, #1			//decrement j
	b WHILELOOP				//branch back to top of while loop
ENDWHILE:
	str v1, [a4]			//store value in v1 = arr[i] at address arr[j]
	add a3, a3, #1
	b FORLOOP
ENDFOR:
	pop {a1-v4} 				//callee-save
	bx lr