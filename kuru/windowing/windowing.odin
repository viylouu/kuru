package windowing

import sdl "vendor:sdl2"

window: ^sdl.Window

create_window :: proc(name:cstring, w,h: i32) -> bool {
    window = sdl.CreateWindow(name, sdl.WINDOWPOS_CENTERED,sdl.WINDOWPOS_CENTERED, w,h, sdl.WINDOW_SHOWN)
    return window != nil
}

destroy_window :: proc() {
    
}