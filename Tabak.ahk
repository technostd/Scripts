Home::
while GetKeyState("Home", "P") 
{
    CoordMode, Pixel, Screen
    
    PixelSearch, OutputVarX, OutputVarY, 620, 290, 1300, 833, 0x00c8ef, 0, Fast RGB
    if !ErrorLevel {
    
        if (OutputVarX > 1100) {
            CoordMode, Mouse, Screen
            MouseMove, OutputVarX + 5, OutputVarY + 20
        }
        else if (OutputVarY > 700) {
            CoordMode, Mouse, Screen
            MouseMove, OutputVarX - 20, OutputVarY + 5
        }
        else {
        CoordMode, Mouse, Screen
        MouseMove, OutputVarX, OutputVarY
        }
    }
}
return
