package main

import "core:fmt"

import "kuru"
import d "kuru/drawing"

import sdl "vendor:sdl2"

WIDTH :: 1280
HEIGHT :: 720

world: [256][256]bool

main :: proc() {
    kuru.master("tut", 1280,720, init,tick,draw,quit)
}

init :: proc() {

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
}

quit :: proc() {

}