# Assembly Language

* .asm files can run in dos
* msdos (Microsoft disk os) can be emulated with dosbox emulator
* DOS commands 
  * C: - Switch to C drive
  * D: - Switch to D drive
  * CD [directory] - Change directory
  * CD.. - Go up one directory level
  * DIR - List files in current directory
  * MOUNT C [path] - Mount a folder as C drive (e.g., MOUNT C C:\Games\DOS)
  * EXIT - Exit DOSBox
  * [filename].EXE - Run an executable
  * [filename].COM - Run a COM program
  * [filename].BAT - Run a batch file
  * CLS - Clear screen
  * VER - Show DOS version
  * HELP - Display help
  * MEM - Display memory information
  * ALT+ENTER - Toggle fullscreen
---
# Executing asm program
* masm file_name.asm
* link file_name.obj
* file_name.exe //for execution
* debug file_name.exe //for debugging and see the results in memory, registers
    * -u //for unAssembling to see where we want to pose the program for registers and memory inspection usually before int 21h (i.e.. just before termination of program)
    * -g <address> //g for go, till which address the program should execute usually to the address for int 21h
    * -d <address> //show the memory(not registers) values from that address to 16x16 bytes, each number is of 1byte (two hex values)
    * -r //for seeing register values
    * -q //for quite
---
# in ALP programs
* jmp ;unconditional jump
* cmp ax, bx ;
  * je ;jump on equal
  * jne ;jump if not equal
  * jg ;jump if greater
  * jl ;jump if less
  * jge ;jump if greater of equal
  * jle ;jump if less or equal
* with dec ax or inc ax
  * jz
  * jnz