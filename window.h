#ifndef WINDOW_H
#define WINDOW_H

#include <stdint.h>

typedef struct {
    int x, y;
    int width, height;
} Window;

void init_video(void);
void print_string(const char* str);

void draw_window(Window* win);
Window* create_window(int x, int y, int width, int height);

#endif
