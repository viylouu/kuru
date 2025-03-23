package drawing

import sdl "vendor:sdl2"

rend: ^sdl.Renderer

// clears the screen with the specified colors
clear :: proc(r,g,b: u8) {
    sdl.SetRenderDrawColor(rend,r,g,b,255)
    sdl.RenderClear(rend)
}

// sets the current color you are using to draw with to this
fill :: proc(r,g,b: u8, a: u8 = 255) {
    sdl.SetRenderDrawColor(rend,r,g,b,a)
}

// draws a pixel at a point
point :: proc(x,y: i32) {
    sdl.RenderDrawPoint(rend,x,y)
}
// draws a pixel at a point
fpoint :: proc(x,y: f32) {
    sdl.RenderDrawPointF(rend, x,y)
}

// draws a rectangle
rect :: proc(x,y,w,h: i32) {
    sdl.RenderDrawRect(
        rend,
        &sdl.Rect {
            x=x,
            y=y,
            w=w,
            h=h,
        }
    )
}
// draws a rectangle
frect :: proc(x,y,w,h: f32) {
    sdl.RenderDrawRectF(
        rend,
        &sdl.FRect {
            x=x,
            y=y,
            w=w,
            h=h,
        }
    )
}

// draws an image
image :: proc(tex: ^sdl.Texture, x,y,w,h: i32) {
    dest: sdl.Rect = { x,y,w,h }
    sdl.RenderCopy(rend, tex, nil, &dest)
}
// draws an image
fimage :: proc(tex: ^sdl.Texture, x,y,w,h: f32) {
    dest: sdl.Rect = { i32(x),i32(y),i32(w),i32(h) }
    sdl.RenderCopy(rend, tex, nil, &dest)
}

// draws an image with a specified source and destination
image_sd :: proc(tex: ^sdl.Texture, sx,sy,sw,sh, dx,dy,dw,dh: i32) {
    src: sdl.Rect = { sx,sy,sw,sh }
    dest: sdl.Rect = { dx,dy,dw,dh }
    sdl.RenderCopy(rend, tex, &src, &dest)
}
// draws an image with a specified source and destination
fimage_sd :: proc(tex: ^sdl.Texture, sx,sy,sw,sh, dx,dy,dw,dh: f32) {
    src: sdl.Rect = { i32(sx),i32(sy),i32(sw),i32(sh) }
    dest: sdl.Rect = { i32(dx),i32(dy),i32(dw),i32(dh) }
    sdl.RenderCopy(rend, tex, &src, &dest)
}