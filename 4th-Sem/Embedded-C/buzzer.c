#include <lpc21xx.h>

int main()
{
    unsigned int delay;

    PINSEL0 = 0x00000000; // Set P0.0 to P0.15 as GPIO
    IO0DIR = 0x00000200;  // Set P0.9 as output

    while (1)
    {
        IO0SET = 0x00000200; // Set P0.9 high (turn on the buzzer)
        for (delay = 0; delay < 100000; delay++)
            ; // Delay loop

        IO0CLR = 0x00000200; // Set P0.9 low (turn off the buzzer)
        for (delay = 0; delay < 100000; delay++)
            ; // Delay loop
    }

    return 0; // This line will never be reached, but it's good practice to include it
}