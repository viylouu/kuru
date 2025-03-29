package main

import "core:fmt"
import "core:math/rand"

import "kuru"
import d "kuru/drawing"
import inp "kuru/input"

import rl "vendor:raylib"
//import sdl "vendor:sdl2"

WIDTH :: 256
HEIGHT :: 256

world: [256][256]bool

main :: proc() {
    kuru.master("sand", WIDTH,HEIGHT, init,tick,draw,quit)
}

init :: proc() {
    //sdl.RenderSetScale(d.rend,4,4)
}

tick :: proc() {

}

draw :: proc() {
    d.clear(0,0,0)

    d.fill(255,255,0)

    updated: [256][256]bool

    for x : i32 = 0; x < 256; x += 1 {
        for y : i32 = 0; y < 256; y += 1 {
            if !world[y][x] {
                continue
            }

            d.point(x,y)

            if updated[y][x] || rand.int31_max(2) == 0 {
                continue
            }

            if y < 255 {
                if !world[y+1][x] {
                    world[y+1][x] = true
                    world[y][x] = false
                    updated[y+1][x] = true
                    continue
                }

                if x > 0 {
                    if !world[y+1][x-1] {
                        world[y+1][x-1] = true
                        world[y][x] = false
                        updated[y+1][x-1] = true
                        continue
                    }
                }

                if x < 255 {
                    if !world[y+1][x+1] {
                        world[y+1][x+1] = true
                        world[y][x] = false
                        updated[y+1][x+1] = true
                        continue
                    }
                }
            }
        }
    }

    if inp.is_mouse_down(rl.MouseButton.LEFT) && inp.mouse_x >= 0 && inp.mouse_y >= 0 && inp.mouse_x <= WIDTH-4 && inp.mouse_y <= HEIGHT-4 {
        world[i32(inp.mouse_y)/4][i32(inp.mouse_x)/4] = true
    }
}

quit :: proc() {

}