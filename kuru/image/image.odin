package image

import "core:fmt"

import sdl "vendor:sdl2"
import sdli "vendor:sdl2/image"

import "../" // kuru
import d "../drawing"


load_bmp :: proc(path: cstring) -> ^sdl.Texture {
    surf := sdl.LoadBMP("assets/backgrounds.bmp")
    return surf_to_tex_with_free(surf)
}

// load tends to be slower than using just bmp apparently, but bmp is a lot larger, so pick your poisson (🐟)
load :: proc(path: cstring) -> ^sdl.Texture {
    surf := sdli.Load(path)
    return surf_to_tex_with_free(surf)
}


surf_to_tex :: proc(surf: ^sdl.Surface) -> ^sdl.Texture {
    if surf == nil {
        fmt.eprintln("failed to load image \"bgtex\"! err: ", sdl.GetError())
        kuru.stop()
        return nil
    }

    tex := sdl.CreateTextureFromSurface(d.rend, surf)
    sdl.FreeSurface(surf)

    if tex == nil {
        fmt.eprintln("failed to convert surface to texture! err: ", sdl.GetError())
        kuru.stop()
        return nil
    }

    return tex
}
surf_to_tex_with_free :: proc(surf: ^sdl.Surface) -> ^sdl.Texture {
    tex := surf_to_tex(surf)
    sdl.FreeSurface(surf)
    return tex
}