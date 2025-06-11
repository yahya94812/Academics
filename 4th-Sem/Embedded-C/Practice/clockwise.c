#include <LPC21xx.h>
// steper moter it controlled with P0.12 to P0.15

int main()
{
    PINSEL0 = 0x00000000;
    IO0DIR = 0x0000F000;
    unsigned long int var1 = 0x000001000; // Starts one bit before P0.12 (at P0.11)

    for (int i = 0; i <= 3; i++)
    {
        IO0CLR = 0x0000F000;    // Clear all motor control pins
        IO0SET = var1;
        var1 = var1 << 1;         // Shifts to next bit: P0.12, P0.13, ..., P0.15
        for (int delay = 0; delay < 10000; delay++);
    }

    return 0;
}