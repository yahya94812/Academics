#include <intrins.h> // Include the intrinsic header for _nop_() function
#include <reg51.h>

int main(){
    unsigned int i;
    unsigned int w[16] = {128, 224, 255, 224, 128, 32, 1, 0, 1, 32, 128, 224, 255, 224, 128, 0};
    while (1)
    {
        for (i = 0; i < 16; i++) {
            P1 = w[i]; // Write the value to port 1
            _nop_(); // No operation, can be used for timing or other purposes
        }
    }
    
    return 0; // This line will never be reached, but it's good practice to include it
}