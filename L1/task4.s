.global _start
	
arr: 		.word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55
n:		.word 10 	//length of array
i:		.word 1 	//index

_start:
MAIN:
	ldr a1, =arr 		//loading parameters for subroutine call
	ldr a2, n		// ||
	ldr a3, i		// ||
	//push {lr}		//retain place in prog. (omit)
	b RIS			//function call (changed to straight branch instruction)
	//pop {lr}		//restore link reg (omit)
STOP:
	b STOP
RIS:
	//push {v1-v5}		//callee-save (omit)
	lsl a4, a3, #2		//calculate offset of element arr[i] (in bytes)
	ldr v1, [a1, a4]	//load the value at arr[i]
	mov v2, a3		//set i = j
LOOP:
	lsls a4, v2, #2		//get bit value of offset and set status bits
	subgt v3, a4, #4	//conditionally subtract 4 to get offset j-1 (condition is a4 > 0)
	ldr v4, [a1, v3]	//load arr[j-1]
	
	cmp v2, #0		//check j - 0 <= 0, j <= 0
	ble END			//if above true branch to end
	cmp v4, v1		//check arr[j-1] - arr[i] <= 0, arr[j-1] <= arr[i]
	ble END			//if above true branch to end
	
	str v4, [a4]		//store value arr[j-1] at address of arr[j] 
	sub v2, v2, #1		//decrement j
	b LOOP			//branch back to start of while loop
END:
	str v1, [a4]		//store value in v1 = arr[i] at address arr[j]
	add v5, a3, #1		//calculate i+1
	cmp a2, v5		//check n -(i + 1) >= 0, n >= i + 1
	movge a3, v5		//{if above true, set i = i+1 as new subroutine parameter
	//pushge {lr}		//{if above true, push link register on stack (omit)
	bge RIS			//{if above true, proceed to recursive function call (change from bl -> b)
	//popge {lr}		//{if above true restore link register from stack (omit)
	//pop {v1-v5}		//restore variable registers  - callee-save (omit)
	b STOP			//return (edit to only branch instruction)