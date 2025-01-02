#include "window.h"
#include <stdlib.h>
#include <stdint.h>
#include "video.h"

void draw_pixel(int x, int y, uint8_t color);

void draw_window(Window* win) {
    for (int i = 0; i < win->width; i++) {
        for (int j = 0; j < win->height; j++) {
            draw_pixel(win->x + i, win->y + j, 0x0F);
        }
    }
}
Window* create_window(int x, int y, int width, int height) {
    Window* win = (Window*)malloc(sizeof(Window));
    win->x = x;
    win->y = y;
    win->width = width;
    win->height = height;
    return win;
}
