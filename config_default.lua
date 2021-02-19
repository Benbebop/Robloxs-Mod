local commands = require(script.Parent:WaitForChild("rModuleClient", math.huge).Misc.commands)

commands:unbindall()

commands:bind("w","+forward")
commands:bind("s","+back")
commands:bind("a","+moveleft")
commands:bind("d","+moveright")

commands:bind("UPARROW","+lookup")
commands:bind("DOWNARROW","+lookdown")
commands:bind("LEFTARROW","+left")
commands:bind("RIGHTARROW","+right")

commands:bind("SPACE","+jump")
commands:bind("CTRL","+duck")
commands:bind("TAB","+showscores")
commands:bind("SHIFT","+speed")
commands:bind("ENTER","+attack")
commands:bind("ALT","+walk")
commands:bind("MOUSE1","+attack")
commands:bind("MOUSE2","+attack2")
commands:bind("MWHEELUP","invprev")
commands:bind("MWHEELDOWN","invnext")

commands:bind("PAUSE","pause")
commands:bind("ESCAPE","cancelselect")
commands:bind("~","toggleconsole")
commands:bind("`","toggleconsole")

commands:bind("F1","gm_showhelp")
commands:bind("F2","gm_showteam")
commands:bind("F3","gm_showspare1")
commands:bind("F4","gm_showspare2")
commands:bind("F5","jpeg")
commands:bind("F7","save quick")
commands:bind("F8","load quick")
commands:bind("F10","toggleconsole")

commands:bind("1","slot1")
commands:bind("2","slot2")
commands:bind("3","slot3")
commands:bind("4","slot4")
commands:bind("5","slot5")
commands:bind("6","slot6")
commands:bind("7","slot7")
commands:bind("8","slot8")
commands:bind("9","slot9")
commands:bind("0","slot0")

commands:bind("q","+menu")
commands:bind("e","+use")
commands:bind("r","+reload")
commands:bind("t","impulse 201")
commands:bind("y","messagemode")
commands:bind("u","messagemode2")

commands:bind("f","impulse 100")

commands:bind("z","gmod_undo")
commands:bind("x","+voicerecord")
commands:bind("c","+menu_context")
commands:bind("v","noclip")
commands:bind("b","+zoom")

commands:cl_allowupload() "1"
commands:cl_smooth() "1"
commands:mp_decals() "2048"
commands:r_decals() "2048"
commands:sensitivity() "6"
