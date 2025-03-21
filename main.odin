package main

import "core:fmt"

import "kuru"
import d "kuru/drawing"

import sdl "vendor:sdl2"

WIDTH :: 1280
HEIGHT :: 720

main :: proc() {
    kuru.master(init,tick,draw,quit)
}

init :: proc() {

}

tick :: proc() {

}

draw :: proc() {
    d.clear(255,255,255)
}

quit :: proc() {

}