package drawing

import sdl "vendor:sdl2"

surf: ^sdl.Surface

clear :: proc(r,g,b: u8) {
    sdl.FillRect(surf, nil, sdl.MapRGB(surf.format, r,g,b))
}