/* linker.ld */
ENTRY(_start)

SECTIONS {
    . = 0x10000;  /* Set start address for kernel (e.g., 64 KB offset) */

    .text : {
        *(.text)  /* All text (code) sections */
    }

    .data : {
        *(.data)  /* All data sections */
    }

    .bss : {
        *(.bss)  /* All bss sections */
    }

    /DISCARD/ : {
        *(.note.gnu.property)  /* Optional, discard sections */
    }
}
