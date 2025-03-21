package drawing

import sdl "vendor:sdl2"

rend: ^sdl.Renderer

clear :: proc(r,g,b: u8) {
    sdl.SetRenderDrawColor(rend,r,g,b,255)
    sdl.RenderClear(rend)
}