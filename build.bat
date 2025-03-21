@echo off

if "%2"=="-n" (
    odin build . -out:build/%1.exe
) else if "%2"=="-s" (
    odin build . -out:build/%1.exe -o:speed
) else if "%2"=="-z" (
    odin build . -out:build/%1.exe -o:size
) else (
    echo unknown optimization
)

copy SDL2.dll build\SDL2.dll