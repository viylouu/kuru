package kuru

import "core:fmt"

import d "drawing"
import w "windowing"
import inp "input"

import sdl "vendor:sdl2"

master :: proc(title:cstring, width,height:i32, start,update,render,close: proc()) {
    init(title,width,height)
    start()

    running := true
    e: sdl.Event
    for running {
        for sdl.PollEvent(&e) {
            if e.type == sdl.EventType.QUIT {
                running = false
                continue
            }

            inp.poll_event(e)
        }

        update()
        render()

        sdl.RenderPresent(d.rend)
    }

    close()
    end()
}

init :: proc(name:cstring,width,height:i32) {
    if sdl.Init(sdl.INIT_VIDEO) < 0 {
        fmt.eprintln("COULD NOT INITIALIZE SDL2! err: %s", sdl.GetError())
        return
    }

    if !w.create_window(name,width,height) {
        fmt.eprintln("COULD NOT CREATE WINDOW! err: %s", sdl.GetError())
        return
    }
}

end :: proc() {
    w.destroy_window()
    sdl.Quit()
}