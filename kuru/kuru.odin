package kuru

import "core:fmt"

import d "drawing"
import w "windowing"

import sdl "vendor:sdl2"

master :: proc(start,update,render,close: proc()) {
    init()
    start()

    running := true
    e: sdl.Event
    for running {
        for sdl.PollEvent(&e) {
            if e.type == sdl.EventType.QUIT {
                running = false
                break
            }

            update()
            render()

            sdl.UpdateWindowSurface(w.window)
        }
    }

    close()
    end()
}

init :: proc() {
    if sdl.Init(sdl.INIT_VIDEO) < 0 {
        fmt.eprintln("COULD NOT INITIALIZE SDL2! err: %s", sdl.GetError())
        return
    }

    if !w.create_window("tut",1280,720) {
        fmt.eprintln("COULD NOT CREATE WINDOW! err: %s", sdl.GetError())
        return
    }
}

end :: proc() {
    sdl.FreeSurface(d.surf)

    w.destroy_window()
    sdl.Quit()
}