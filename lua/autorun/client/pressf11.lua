hook.Add("Think", "kpCheck", function()
    if gui.IsGameUIVisible() then return end

    if vgui.GetKeyboardFocus() then return end

    -- Example: Check if the E key is pressed
    if input.IsKeyDown(KEY_F11) then
        print("Press F11 - Eida 2024")
        if not IsValid(friendstoolmenu) then
            gui.EnableScreenClicker(true)
            friendstoolmenu = vgui.Create("DFrame")
            friendstoolmenu:SetSize(400, 200)
            friendstoolmenu:Center()
            friendstoolmenu:SetTitle("F11 Menu")
            friendstoolmenu:SetDraggable(true)
            friendstoolmenu:ShowCloseButton(true)
            friendstoolmenu.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
	            draw.RoundedBox( 0, 0, 0, w, h, Color( 20, 20, 20) ) -- Draw a red box instead of the frame
            end

            local tabs = vgui.Create("DPropertySheet", frame)
            tabs:Dock(FILL)
        else
            friendstoolmenu:Close()
            gui.EnableScreenClicker(false)
        end
    end
end)