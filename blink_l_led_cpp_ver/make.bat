cd %~dp0
arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -c main.cpp -o main.o -nostdlib -nostartfiles 
arm-none-eabi-ld -T linker.ld -o main.elf main.o
arm-none-eabi-objcopy -O srec  --srec-len 16 --srec-forceS3 main.elf main.mot
arm-none-eabi-objdump -D main.elf > objdump.txt