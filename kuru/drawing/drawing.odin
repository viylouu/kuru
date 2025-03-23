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
fpoint :: proc(x,y: f32) {
    sdl.RenderDrawPointF(rend, x,y)
}

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

image :: proc(tex: ^sdl.Texture, x,y,w,h: i32) {
    dest: sdl.Rect = { x,y,w,h }
    sdl.RenderCopy(rend, tex, nil, &dest)
}
fimage :: proc(tex: ^sdl.Texture, x,y,w,h: f32) {
    dest: sdl.Rect = { i32(x),i32(y),i32(w),i32(h) }
    sdl.RenderCopy(rend, tex, nil, &dest)
}

// the only diff is this uses a source and destination rater than just a destination
image_sd :: proc(tex: ^sdl.Texture, sx,sy,sw,sh, dx,dy,dw,dh: i32) {
    src: sdl.Rect = { sx,sy,sw,sh }
    dest: sdl.Rect = { dx,dy,dw,dh }
    sdl.RenderCopy(rend, tex, &src, &dest)
}
fimage_sd :: proc(tex: ^sdl.Texture, sx,sy,sw,sh, dx,dy,dw,dh: f32) {
    src: sdl.Rect = { i32(sx),i32(sy),i32(sw),i32(sh) }
    dest: sdl.Rect = { i32(dx),i32(dy),i32(dw),i32(dh) }
    sdl.RenderCopy(rend, tex, &src, &dest)
}