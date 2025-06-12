#include <lpc21xx.h>

void clock_wise(void);
void anti_clock_wise(void);

int main()
{
    PINSEL0 = 0x00000000;
    IO0DIR = 0x0000F000;
    while (1)
    {
        for(int i=0; i<50; i++)
            clock_wise();

        for(int i=0; i<65000; i++);

        for(int i=0; i<50; i++)
            anti_clock_wise();

        for(int i=0; i<65000; i++);
    }

    return 0;
}

void clock_wise(void){
    unsigned long int var = 0x00001000;

    for(int i=0; i<4; i++){
        IO0CLR = 0x0000F000;
        IO0SET = var;
        var = var << 1;

        for(int j=0; j<10000; j++);
    }
}

void anti_clock_wise(void){
    unsigned long int var = 0x00008000;

    for(int i=0; i<4; i++){
        IO0CLR = 0x0000F000;
        IO0SET = var;
        var = var >> 1;

        for(int j=0; j<10000; j++);
    }
}