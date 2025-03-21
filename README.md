# kuru (engine)
kuru is a game engine built for odin

### build command
just regular odin build command examples  
you can obv just replace kuru.exe with (programname).exe  
`odin build . -out:build/kuru.exe; copy SDL2.dll build\SDL2.dll` for no compiler optimizations  
`odin build . -out:build/kuru.exe -o:speed; copy SDL2.dll build\SDL2.dll` for performance  
`odin build . -out:build/kuru.exe -o:size; copy SDL2.dll build\SDL2.dll` for build size