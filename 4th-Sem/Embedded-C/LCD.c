// To interface LCD with ARM processor ARM7 TDMI/LPC2148 for displaying predefined data

#include <lpc214x.h>
#include <stdio.h>

// Function prototypes
void lcd_init(void); // initialization of LCD
void clr_disp(void);
void delay(unsigned int);
void lcd_com(void);  // LCD command
void wr_cn(void);    // write command nibble
void lcd_data(void); // LCD data
void wr_dn(void);    // wite data nibble

unsigned char temp1;
unsigned long int temp, r = 0;
unsigned char *ptr, disp[] = "pda,", disp1[] = "cse";

int main()
{
    PINSEL0 = 0x00000000;
    IO0DIR = 0x000000FC; // configure o/p lines for LCD(P0.2 to P0.7)
    
    delay(3200);

    lcd_init();
    delay(3200);

    clr_disp();
    delay(3200);

    //........LCD DISPLAY TEST.........//
    temp1 = 0x80; // Display starting address	of first line 1 th pos
    lcd_com();

    ptr = disp;
    while (*ptr != '\0')
    {
        temp1 = *ptr;
        lcd_data();
        ptr++;
    }

    temp1 = 0xC0; // Display starting address of second line 4 th pos
    lcd_com();

    ptr = disp1;
    while (*ptr != '\0')
    {
        temp1 = *ptr;
        lcd_data();
        ptr++;
    }
    while (1)
        ;
} // end of main()

void lcd_init(void)
{
    temp = 0x30;
    wr_cn();
    delay(3200);

    temp = 0x30;
    wr_cn();
    delay(3200);

    temp = 0x30; // Forces LCD into 8-bit mode (required for some power-on states)
    wr_cn();
    delay(3200);

    temp = 0x20; // Switches to 4-bit mode
    wr_cn();
    delay(3200);

    temp1 = 0x28; // Function set: 4-bit, 2-line, 5x7 dots
    lcd_com();
    delay(3200);

    temp1 = 0x0C; // Display ON, Cursor OFF, Blink OFF
    lcd_com();
    delay(800);

    temp1 = 0x06; // Entry mode: Increment cursor
    lcd_com();
    delay(800);

    temp1 = 0x80; // Set the cursor to beginning of line 1
    lcd_com();
    delay(800);
}

void lcd_com(void)
{
    temp = temp1 & 0xf0;
    wr_cn();
    temp = temp1 & 0x0f;
    temp = temp << 4;
    wr_cn();
    delay(500);
}

void wr_cn(void)
{
    IO0CLR = 0x000000FC; // clear the port lines.
    IO0SET = temp;       // Assign the value to the PORT lines
    IO0CLR = 0x00000004; // RS (Register Select) pin low to indicate a command
    IO0SET = 0x00000008; // E=1 Toggling the E (Enable) pin to latch the data.
    delay(10);
    IO0CLR = 0x00000008; // back to E=0
}

void lcd_data(void)
{
    temp = temp1 & 0xf0;
    wr_dn();
    temp = temp1 & 0x0f;
    temp = temp << 4;
    wr_dn();
    delay(100);
}

void wr_dn(void) ////write data reg
{
    IO0CLR = 0x000000FC; // clear the port lines.
    IO0SET = temp;       // Assign the value to the PORT lines
    IO0SET = 0x00000004; // set bit  RS = 1
    IO0SET = 0x00000008; // E=1
    delay(10);
    IO0CLR = 0x00000008; // E=0
}

void clr_disp(void)
{
    temp1 = 0x01;
    lcd_com();
    delay(500);
}

void delay(unsigned int r1)
{
    for (r = 0; r < r1; r++)
        ;
}
