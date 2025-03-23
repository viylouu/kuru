package input

import "../misc"

import sdl "vendor:sdl2"

key_states: [256]bool
mouse_states: [25]bool
mouse_x,mouse_y: f32
mouse_scroll_delta_x,mouse_scroll_delta_y: i32

// messi ahh function
poll_event :: proc(e: sdl.Event) {
    #partial switch e.type {
        case sdl.EventType.KEYDOWN:
            key_states[e.key.keysym.scancode] = true
        case sdl.EventType.KEYUP:
            key_states[e.key.keysym.scancode] = false
        case sdl.EventType.MOUSEMOTION:
            mouse_x = f32(e.motion.x)/misc.scale
            mouse_y = f32(e.motion.y)/misc.scale
        case sdl.EventType.MOUSEBUTTONDOWN:
            mouse_states[e.button.button] = true
        case sdl.EventType.MOUSEBUTTONUP:
            mouse_states[e.button.button] = false
        case sdl.EventType.MOUSEWHEEL:
            mouse_scroll_delta_x = e.wheel.x
            mouse_scroll_delta_y = e.wheel.y
    }
}

// checks if key "x" is currently being pressed
is_key_down :: proc(scancode: sdl.Scancode) -> bool {
    return key_states[scancode]
}
// checks if key "x" is currently not being pressed
is_key_up :: proc(scancode: sdl.Scancode) -> bool {
    return !key_states[scancode]
}

// checks if mouse button "x" is currently being pressed
is_mouse_down :: proc(button: int) -> bool {
    return mouse_states[button]
}
// checks if mouse button "x" is currently not being pressed
is_mouse_up :: proc(button: int) -> bool {
    return !mouse_states[button]
}

// checks if the user is scrolling the mouse wheel horizontally
is_mouse_scroll_x :: proc() -> bool {
    return mouse_scroll_delta_x != 0
}
// checks if the user is scrolling the mouse wheel vertically (normal)
is_mouse_scroll_y :: proc() -> bool {
    return mouse_scroll_delta_y != 0
}