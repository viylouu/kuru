package input

import sdl "vendor:sdl2"

key_states: [256]bool
mouse_states: [25]bool
mouse_x,mouse_y: i32
mouse_scroll_delta_x,mouse_scroll_delta_y: i32

poll_event :: proc(e: sdl.Event) {
    #partial switch e.type {
        case sdl.EventType.KEYDOWN:
            key_states[e.key.keysym.scancode] = true
        case sdl.EventType.KEYUP:
            key_states[e.key.keysym.scancode] = false
        case sdl.EventType.MOUSEMOTION:
            mouse_x = e.motion.x
            mouse_y = e.motion.y
        case sdl.EventType.MOUSEBUTTONDOWN:
            mouse_states[e.button.button] = true
        case sdl.EventType.MOUSEBUTTONUP:
            mouse_states[e.button.button] = false
        case sdl.EventType.MOUSEWHEEL:
            mouse_scroll_delta_x = e.wheel.x
            mouse_scroll_delta_y = e.wheel.y
    }
}

is_key_down :: proc(scancode: sdl.Scancode) -> bool {
    return key_states[scancode]
}

is_key_up :: proc(scancode: sdl.Scancode) -> bool {
    return !key_states[scancode]
}

is_mouse_down :: proc(button: int) -> bool {
    return mouse_states[button]
}

is_mouse_up :: proc(button: int) -> bool {
    return !mouse_states[button]
}