#include <LPC21xx.h>
// steper moter it controlled with P0.12 to P0.15
int main()
{

    PINSEL0 = 0x00000000;
    IO0DIR = 0x0000F000;
    unsigned long int var2, var1 = 0x00000800; // Starts one bit before P0.12 (at P0.11)

    for (int i = 0; i <= 3; i++)
    {
        var1 = var1 >> 1;         // Shifts to next bit: P0.12, P0.13, ..., P0.15
        var2 = ~var1;             // Invert all bits
        var2 = var2 & 0x0000F000; // Mask to keep only P0.12 to P0.15
        IOPIN = ~var2;            // Invert again so only one bit (P0.12 to P0.15) is ON
    }

    return 0;
}