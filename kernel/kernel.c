#include "video.h"
#include "keyboard.h"
#include "kernel.h"
void kernel_main(void) {
    //hi//
}

void _start(void) {
    kernel_main();
}
void kernel_main(void) {
    init_video();
    print_string("Welcome to DanhOS!\n");
    print_string("Made in VietNAM\n");
    print_string("This OS includes GUI, TEXT\n");
    print_string("OS still in development\n");
    init_keyboard();
    while (1) {
    }
}
