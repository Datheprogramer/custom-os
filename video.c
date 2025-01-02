#include "video.h"
#define VGA_MEMORY 0xB8000
#define WHITE_ON_BLACK 0x0F

void init_video(void) {}

void print_string(const char *str) {
    unsigned short *vga_buffer = (unsigned short *)VGA_MEMORY;
    unsigned short color = WHITE_ON_BLACK;
    while (*str) {
        if (*str == '\n') {
            vga_buffer += 80;
        } else {
            *vga_buffer++ = (*str++ | color << 8);
        }
    }
}
