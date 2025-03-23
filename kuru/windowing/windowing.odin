package windowing

import d "../drawing"

import sdl "vendor:sdl2"

window: ^sdl.Window

// initializes the current window
create_window :: proc(name:cstring, w,h: i32) -> bool {
    sdl.CreateWindowAndRenderer(w,h, sdl.WINDOW_SHOWN, &window, &d.rend)
    sdl.SetWindowTitle(window, name)
    return window != nil && d.rend != nil
}

// destroys the current window
destroy_window :: proc() {
    sdl.DestroyWindow(window)
}