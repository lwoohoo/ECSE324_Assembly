.global _start

PIXELBUFF:	.word 0xc8000000
CHARBUFF:	.word 0xc9000000
start:
        bl      draw_test_screen
end:
		mov a1, #0
		mov a2, #0
		mov a3, #0
		mov a4, #0
		mov v1, #0
		mov v2, #0
		mov lr, #0
		mov sp, #0
        b       end
@ TODO: Insert VGA driver functions here.
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
	
draw_test_screen:
        push    {r4, r5, r6, r7, r8, r9, r10, lr}
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
        mov     r6, #0
        ldr     r10, .draw_test_screen_L8
        ldr     r9, .draw_test_screen_L8+4
        ldr     r8, .draw_test_screen_L8+8
        b       .draw_test_screen_L2
.draw_test_screen_L7:
        add     r6, r6, #1
        cmp     r6, #320
        beq     .draw_test_screen_L4
.draw_test_screen_L2:
        smull   r3, r7, r10, r6
        asr     r3, r6, #31
        rsb     r7, r3, r7, asr #2
        lsl     r7, r7, #5
        lsl     r5, r6, #5
        mov     r4, #0
.draw_test_screen_L3:
        smull   r3, r2, r9, r5
        add     r3, r2, r5
        asr     r2, r5, #31
        rsb     r2, r2, r3, asr #9
        orr     r2, r7, r2, lsl #11
        lsl     r3, r4, #5
        smull   r0, r1, r8, r3
        add     r1, r1, r3
        asr     r3, r3, #31
        rsb     r3, r3, r1, asr #7
        orr     r2, r2, r3
        mov     r1, r4
        mov     r0, r6
        bl      VGA_draw_point_ASM
        add     r4, r4, #1
        add     r5, r5, #32
        cmp     r4, #240
        bne     .draw_test_screen_L3
        b       .draw_test_screen_L7
.draw_test_screen_L4:
        mov     r2, #72
        mov     r1, #5
        mov     r0, #20
        bl      VGA_write_char_ASM
        mov     r2, #101
        mov     r1, #5
        mov     r0, #21
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #22
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #23
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #24
        bl      VGA_write_char_ASM
        mov     r2, #32
        mov     r1, #5
        mov     r0, #25
        bl      VGA_write_char_ASM
        mov     r2, #87
        mov     r1, #5
        mov     r0, #26
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #27
        bl      VGA_write_char_ASM
        mov     r2, #114
        mov     r1, #5
        mov     r0, #28
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #29
        bl      VGA_write_char_ASM
        mov     r2, #100
        mov     r1, #5
        mov     r0, #30
        bl      VGA_write_char_ASM
        mov     r2, #33
        mov     r1, #5
        mov     r0, #31
        bl      VGA_write_char_ASM
        pop     {r4, r5, r6, r7, r8, r9, r10, pc}
.draw_test_screen_L8:
        .word   1717986919
        .word   -368140053
        .word   -2004318071
	
	