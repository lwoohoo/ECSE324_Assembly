.global _start
.equ KBADD, 0xff200100
PIXELBUFF:	.word 0xc8000000
CHARBUFF:	.word 0xc9000000

_start:
        bl      input_loop
end:
        b       end

@ TODO: copy VGA driver here.
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
	
@ TODO: insert PS/2 driver here.
read_PS2_data_ASM:
	ldr a3, =KBADD	//load address of mem map kb reg
	ldr a2, [a3]
	lsr a4, a2, #15		//shift to access rvalid bit
	tst a4, #0x1	//extract bit and update cpsr
	
	push {lr}
	blgt TRUE_CASE
	pop {lr}
	
	tst a4, #0x1
	moveq a1, #0			//set output to 0 in false case
	bx lr
	
TRUE_CASE:
	strgtb a2, [a1]		//strb at input address
	movgt a1, #1		//set output to 1
	bx lr
	
write_hex_digit:
        push    {r4, lr}
        cmp     r2, #9
        addhi   r2, r2, #55
        addls   r2, r2, #48
        and     r2, r2, #255
        bl      VGA_write_char_ASM
        pop     {r4, pc}
write_byte:
        push    {r4, r5, r6, lr}
        mov     r5, r0
        mov     r6, r1
        mov     r4, r2
        lsr     r2, r2, #4
        bl      write_hex_digit
        and     r2, r4, #15
        mov     r1, r6
        add     r0, r5, #1
        bl      write_hex_digit
        pop     {r4, r5, r6, pc}
input_loop:
        push    {r4, r5, lr}
        sub     sp, sp, #12
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
        mov     r4, #0
        mov     r5, r4
        b       .input_loop_L9
.input_loop_L13:
        ldrb    r2, [sp, #7]
        mov     r1, r4
        mov     r0, r5
        bl      write_byte
        add     r5, r5, #3
        cmp     r5, #79
        addgt   r4, r4, #1
        movgt   r5, #0
.input_loop_L8:
        cmp     r4, #59
        bgt     .input_loop_L12
.input_loop_L9:
        add     r0, sp, #7
        bl      read_PS2_data_ASM
        cmp     r0, #0
        beq     .input_loop_L8
        b       .input_loop_L13
.input_loop_L12:
        add     sp, sp, #12
        pop     {r4, r5, pc}
	
	
	