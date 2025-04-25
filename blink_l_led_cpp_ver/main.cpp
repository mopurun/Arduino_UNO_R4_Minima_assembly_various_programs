#define STACK_TOP 0x20000630
#define GPIOD_BASE ((volatile unsigned long *) (0x40040020))
#define GPIOD_ODR ((volatile unsigned long *) (GPIOD_BASE+0))

//P111 = LED

int main(void);
void delay(int value);

__attribute__ ((section("vector_table")))
void (*const vector_table[])(void) = {
    (void(*)(void))STACK_TOP,
    (void(*)(void))main,
    (void(*)(void))main,
    (void(*)(void))main
};

int main(void){


    while(1){
        *GPIOD_ODR = 0x08000800;
        delay(10000);
        *GPIOD_ODR = 0x00000800;
        delay(10000);
    }

    return 0;
}

void delay(int value){
    for(int i = 0; i < value ; i++){
        asm volatile("nop");
    }

}