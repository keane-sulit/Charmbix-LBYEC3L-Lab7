
_forward:

;Lab7Compiler.c,1 :: 		void forward() {
;Lab7Compiler.c,3 :: 		PORTB = 0x05;
	MOVLW      5
	MOVWF      PORTB+0
;Lab7Compiler.c,4 :: 		}
L_end_forward:
	RETURN
; end of _forward

_backward:

;Lab7Compiler.c,6 :: 		void backward() {
;Lab7Compiler.c,8 :: 		PORTB = 0x0A;
	MOVLW      10
	MOVWF      PORTB+0
;Lab7Compiler.c,9 :: 		}
L_end_backward:
	RETURN
; end of _backward

_left:

;Lab7Compiler.c,11 :: 		void left() {
;Lab7Compiler.c,13 :: 		PORTB = 0x02;
	MOVLW      2
	MOVWF      PORTB+0
;Lab7Compiler.c,14 :: 		}
L_end_left:
	RETURN
; end of _left

_right:

;Lab7Compiler.c,16 :: 		void right() {
;Lab7Compiler.c,18 :: 		PORTB = 0x04;
	MOVLW      4
	MOVWF      PORTB+0
;Lab7Compiler.c,19 :: 		}
L_end_right:
	RETURN
; end of _right

_speed:

;Lab7Compiler.c,21 :: 		void speed() {
;Lab7Compiler.c,22 :: 		PWM1_Init(10000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Lab7Compiler.c,23 :: 		PWM2_Init(10000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Lab7Compiler.c,24 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Lab7Compiler.c,25 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Lab7Compiler.c,26 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Lab7Compiler.c,27 :: 		PWM2_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Lab7Compiler.c,28 :: 		}
L_end_speed:
	RETURN
; end of _speed

_main:

;Lab7Compiler.c,30 :: 		void main() {
;Lab7Compiler.c,31 :: 		TRISB = 0;
	CLRF       TRISB+0
;Lab7Compiler.c,34 :: 		speed();
	CALL       _speed+0
;Lab7Compiler.c,35 :: 		while(1) {
L_main0:
;Lab7Compiler.c,36 :: 		forward();
	CALL       _forward+0
;Lab7Compiler.c,37 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Lab7Compiler.c,38 :: 		backward();
	CALL       _backward+0
;Lab7Compiler.c,39 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Lab7Compiler.c,40 :: 		left();
	CALL       _left+0
;Lab7Compiler.c,41 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Lab7Compiler.c,42 :: 		right();
	CALL       _right+0
;Lab7Compiler.c,43 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Lab7Compiler.c,44 :: 		}
	GOTO       L_main0
;Lab7Compiler.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
