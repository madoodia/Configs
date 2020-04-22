- Implementing Debugging System in VSCode for C++ projects:
will be update soon

-----
Watch Memory addresses in VSCode Debug Console

- watch the registers in
    - `-exec info registers`

- watch the memory cells in hex format
    - `-exec x/16x address`

- watch the memory cells in binary format
    - `-exec x/16t address`

related to this link: https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

- 1: 1 memory cell, x: hexadecimal show, b: one byte 
    - `-exec x/1xb 0x7fffffffdc48`

- 1: 1 memory cell, x: hexadecimal show, h: two byte (half word)
    - `-exec x/1xh 0x7fffffffdc48`
    
- 1: 1 memory cell, x: hexadecimal show, w: four byte (one word)
    - `-exec x/1xw 0x7fffffffdc48`
    
- 1: 1 memory cell, x: hexadecimal show, g: eight byte (giant words)
    - `-exec x/1xg 0x7fffffffdc48`
    
- other samples
    - `-exec x/4xg 0x7fffffffdc48`
    - `-exec x/4tg 0x7fffffffdc48`
    - `-exec x/16xb 0x7fffffffdc48`
    - `-exec x/16tb 0x7fffffffdc48`

