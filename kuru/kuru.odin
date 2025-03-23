package kuru

import "core:fmt"

import "misc"
import d "drawing"
import w "windowing"
import inp "input"

import sdl "vendor:sdl2"

running: bool

// basic setup for everything
master :: proc(title:cstring, width,height:i32, scale:f32 = 1, start,update,render,close: proc()) {
    init(title,i32(f32(width)*scale),i32(f32(height)*scale))

    misc.scale = scale

    sdl.RenderSetScale(d.rend,scale,scale)

    start()

    running = true
    e: sdl.Event
    for running {
        inp.mouse_scroll_delta_x = 0
        inp.mouse_scroll_delta_y = 0

        for sdl.PollEvent(&e) {
            if e.type == sdl.EventType.QUIT {
                stop()
                continue
            }

            inp.poll_event(e)
        }

        update()
        render()

        sdl.RenderPresent(d.rend)
    }

    close()
    cleanup()
}

// initializes the sdl context with the window setup
init :: proc(name:cstring,width,height:i32) {
    if sdl.Init(sdl.INIT_VIDEO) < 0 {
        fmt.eprintln("failed to init sdl2! err: %s", sdl.GetError())
        stop()
        return
    }

    if !w.create_window(name,width,height) {
        fmt.eprintln("failed to create window! err: %s", sdl.GetError())
        stop()
        return
    }
}

// stops the current game loop (does not quit prematurely)
stop :: proc() {
    running = false
}

// this is NOT used to close the program, this is called at the end of the "master" function
cleanup :: proc() {
    w.destroy_window()
    sdl.Quit()
}