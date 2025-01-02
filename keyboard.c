#include "keyboard.h"
extern void print_string(const char *str);

void init_keyboard(void) {}

void print_char(char c) {
    char str[2] = {c, '\0'};
    print_string(str);
}
