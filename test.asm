; This is a test program
; These are comments
;
; Create a sprite attribute
LRC r0 #64 ; Segment address
LRC r1 #0 ; Byte address
LRC r3 #128; flags for sprite attrs: binary: 1000-0000
; a blank line

STR r3 r0 r1 ; set the flags
LRC r1 #3 ; byte address of width
LRC r3 #16
STR r3 r0 r1 ; set width
LRC r1 #4 ; byte address of height
STR r3 r0 r1 ; set height
LRC r4 #5 ; Segment address of sprite segment address in sprite attribute
LRC r5 #128 ; Segment address of sprite
STR r5 r0 r4
LRC r4 #7 ; Byte address of color 0 in sprite
LRC r5 $FF ; Color: white
STR r5 r0 r4
LRC r4 #8 ; color 1
LRC r5 $0F
STR r5 r0 r4
LRC r4 #9 ; color 2
LRC r5 $F0
STR r5 r0 r4
LRC r4 #10 ; color 3
LRC r5 $88
STR r5 r0 r4
LRC r0 #80
LRC r1 #16
LRC r2 #75 ; Color: light blue
STR r2 r0 r1
; Load the joystick 1 button address
LRC r0 #127
LRC r1 #0
; Loop forever until the user clicks the x 
@forever; comments after label work
; comments below label work
LRC r3 #2 ; 0000 0010
LDR r2 r0 r1 ; r2 now holds the button states of joystick 1
AND r2 r2 r3
CMP r4 r2 r3 ; r4 is "equal" if only joystick 1 up button is pressed
LRL r9 r10 @movedown
JEQ r4 r9 r10
@donemovedown
LDR r2 r0 r1 ; r2 now holds the button states of joystick 1
LRC r3 #1 ; 0000 0001
AND r2 r2 r3
CMP r4 r2 r3
LRL r9 r10 @moveup
JEQ r4 r9 r10
@donemoveup
LDR r2 r0 r1 ; r2 now holds the button states of joystick 1
LRC r3 #4 ; 0000 0100
AND r2 r2 r3
CMP r4 r2 r3
LRL r9 r10 @moveleft
JEQ r4 r9 r10
@donemoveleft
LDR r2 r0 r1 ; r2 now holds the button states of joystick 1
LRC r3 #8 ; 0000 1000
AND r2 r2 r3
CMP r4 r2 r3
LRL r9 r10 @moveright
JEQ r4 r9 r10
@donemoveright
LRL r9 r10 @forever; back up
JMP r9 r10
;
@movedown
LRC r5 #64
LRC r6 #2
LDR r7 r5 r6
LRC r8 #5 ; move speed 5
ADD r7 r7 r8
STR r7 r5 r6
LRL r9 r10 @donemovedown
JMP r9 r10
;
@moveup
LRC r5 #64
LRC r6 #2
LDR r7 r5 r6
LRC r8 #5 ; move speed 5
SUB r7 r7 r8
STR r7 r5 r6
LRL r9 r10 @donemoveup
JMP r9 r10
;
@moveleft
LRC r5 #64
LRC r6 #1
LDR r7 r5 r6
LRC r8 #5 ; move speed 5
SUB r7 r7 r8
STR r7 r5 r6
LRL r9 r10 @donemoveleft
JMP r9 r10
;
@moveright
LRC r5 #64
LRC r6 #1
LDR r7 r5 r6
LRC r8 #5 ; move speed 5
ADD r7 r7 r8
STR r7 r5 r6
LRL r9 r10 @donemoveright
JMP r9 r10
