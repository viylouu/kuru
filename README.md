# kuru (engine)
kuru is a game engine built for odin

### build command
`odin build . -out:build/[NAME].exe; copy SDL2.dll build\SDL2.dll` for no compiler optimizations  
`odin build . -out:build/[NAME].exe -o:speed; copy SDL2.dll build\SDL2.dll` for performance  
`odin build . -out:build/[NAME].exe -o:size; copy SDL2.dll build\SDL2.dll` for build size