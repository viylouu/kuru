package main

import "core:fmt"

import "kuru"
import d "kuru/drawing"
import inp "kuru/input"

import sdl "vendor:sdl2"

WIDTH :: 256*4
HEIGHT :: 256*4

world: [256][256]bool

main :: proc() {
    kuru.master("tut", WIDTH,HEIGHT, init,tick,draw,quit)
}

init :: proc() {
    sdl.RenderSetScale(d.rend,4,4)
}

tick :: proc() {

}

draw :: proc() {
    d.clear(0,0,0)

    d.fill(255,255,0)
    for x : i32 = 0; x < 256; x += 1 {
        for y : i32 = 0; y < 256; y += 1 {
            if world[y][x] {
                d.point(x,y)
            }
        }
    }

    if inp.is_mouse_down(sdl.BUTTON_LEFT) {
        world[inp.mouse_y/4][inp.mouse_x/4] = true
    }
}

quit :: proc() {

}