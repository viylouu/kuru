package drawing

import sdl "vendor:sdl2"

rend: ^sdl.Renderer

clear :: proc(r,g,b: u8) {
    sdl.SetRenderDrawColor(rend,r,g,b,255)
    sdl.RenderClear(rend)
}

fill :: proc(r,g,b: u8, a: u8 = 255) {
    sdl.SetRenderDrawColor(rend,r,g,b,a)
}

point :: proc(x,y: i32) {
    sdl.RenderDrawPoint(rend,x,y)
}