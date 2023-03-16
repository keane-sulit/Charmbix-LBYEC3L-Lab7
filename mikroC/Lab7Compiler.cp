#line 1 "//Mac/Home/Documents/GitHub/Charmbix-LBYEC3L-Lab7/mikroC/Lab7Compiler.c"
void forward() {

 PORTB = 0x05;
}

void backward() {

 PORTB = 0x0A;
}

void left() {

 PORTB = 0x02;
}

void right() {

 PORTB = 0x04;
}

void speed() {
 PWM1_Init(10000);
 PWM2_Init(10000);
 PWM1_Start();
 PWM1_Set_Duty(255);
 PWM2_Start();
 PWM2_Set_Duty(255);
}

void main() {
 TRISB = 0;


 speed();
 while(1) {
 forward();
 delay_ms(2000);
 backward();
 delay_ms(2000);
 left();
 delay_ms(2000);
 right();
 delay_ms(2000);
 }

}
