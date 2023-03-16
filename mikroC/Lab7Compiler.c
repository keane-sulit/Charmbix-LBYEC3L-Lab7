void forward() {
    // 0000 0101
    PORTB = 0x05;
}

void backward() {
    // 0000 1010
    PORTB = 0x0A;
}

void left() {
    // 0000 0010
    PORTB = 0x02;
}

void right() {
    // 0000 0100
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
    //TRISC = 0;
    //PORTC = 0xFF;
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