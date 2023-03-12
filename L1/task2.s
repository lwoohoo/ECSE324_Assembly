.global _start

arr:		.word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55
n:		.word 10 	//array length
i:		.word 1  	//index

_start:
	ldr a1, =arr		//load pointer to head of array
	ldr a2, n		//load length of the array
	ldr a3, i		//load index i to start
FORLOOP:
	cmp a2, a3		//make initial comparison to see if loop or not
	ble ENDFOR		//leave loop if n-i <= 0, n <= i
	lsl a4, a3, #2		//calculate offset wrt to i (for arr[i] calc.) (in bits)
	ldr v1, [a1, a4]	//load the element of the array offset by a4 = i*4
	mov v2, a3		//set j=i 
	
WHILELOOP:
	lsls a4, v2, #2		//calculate offset j -> need to do every round for relative accuracy (update status bits)
	subgt v3, a4, #4 	//calculate offset j-1 (conditional a4 non-zero)
	ldr v4, [a1, v3]	//load the element of the array offset by v3 = i*4-4, i = j
	cmp v2, #0		//see if j-0 <= 0, or j <= 0
	ble ENDWHILE		//if above true branch end of while
	cmp v4, v1		//see if arr[j-1] - arr[i] <= 0, or arr[j-1] <= arr[i]
	ble ENDWHILE		//if above true branch to end of while
	str v4, [a4]		//store value in v4 = arr[j-1] at address of arr[j] = offset j from 0
	
	sub v2, v2, #1		//decrement j
	b WHILELOOP		//branch back to top of while loop
ENDWHILE:
	str v1, [a4]		//store value in v1 = arr[i] at address arr[j]
	add a3, a3, #1
	b FORLOOP
ENDFOR:
STOP:
	b STOP
	
	