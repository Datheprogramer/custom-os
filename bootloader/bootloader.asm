[ORG 0x7C00]

    ; Bootloader code
    ; Just jump to the kernel for now
    jmp 0x1000

times 510 - ($ - $$) db 0   ; Fill the rest of the bootloader with 0s
dw 0xAA55                   ; Bootloader signature
