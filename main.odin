package main

import "core:fmt"

import sdl "vendor:sdl2"

WIDTH :: 1280
HEIGHT :: 720

main :: proc() {
    window: ^sdl.Window
    surf: ^sdl.Surface

    if sdl.Init(sdl.INIT_VIDEO) < 0 {
        fmt.eprintln("COULD NOT INITIALIZE SDL2! err: %s", sdl.GetError())
        return
    } 
    defer sdl.Quit()

    window = sdl.CreateWindow("tut", sdl.WINDOWPOS_UNDEFINED,sdl.WINDOWPOS_UNDEFINED, WIDTH,HEIGHT, sdl.WINDOW_SHOWN)
    defer sdl.DestroyWindow(window)
    
    if window == nil {
        fmt.eprintln("COULD NOT CREATE WINDOW! err: %s", sdl.GetError())
        return
    }

    surf = sdl.GetWindowSurface(window)

        sdl.FillRect(surf,nil,sdl.MapRGB(surf.format, 0xFF,0xFF,0xFF))

    sdl.UpdateWindowSurface(window)
    
    // get window to stay up
    e: sdl.Event
    quit: bool
    for !quit {
        for sdl.PollEvent(&e) {
            if e.type == sdl.EventType.QUIT {
                quit = true
            }
        }
    }
}