#include <lpc21xx.h>

int main()
{
    unsigned int delay;

    PINSEL0 = 0x00000000; //(32bit value register), configures the gpio for PORT0s P0.0-P0.15 pins; Set P0.0 to P0.15 as GPIO; PINSEL0 = P0.0–P0.15(so each pin has 2bits in PINSEL0 register; 00-for gpio, 01(and other)-for alternate function), PINSEL1 = P0.16–P0.31, best practice is to set all pins to GPIO mode if not used for alternate functions
    IO0DIR = 0x00000001;  // (configures the direction of PORT0 pins)Set P0.0 as output (P0.0 is the first pin, so we set the first bit to 1)

    while (1)
    {
        IO0SET = 0x00000001; // Set P0.0 high (turn on the LED); simply set the first bit of IO0SET register to 1
        for (delay = 0; delay < 100000; delay++)
            ; // Delay loop

        IO0CLR = 0x00000001; // Set P0.0 low (turn off the LED); simply clear the first bit of IO0CLR register to 0
        for (delay = 0; delay < 100000; delay++)
            ; // Delay loop
    }

    return 0; // This line will never be reached, but it's good practice to include it
}