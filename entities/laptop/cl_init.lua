surface.CreateFont("menuText", {
    font = "Arial",
    extended = false,
    size = 30,
    weight = 1000,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})

include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

net.Receive("bagszys_boosted_contracts_menu", function(length, player)
    local laptop = net.ReadEntity()

    if !Frame then

        local Frame = vgui.Create("DFrame")
        Frame:SetTitle("Contracts")
        Frame:SetSize(2000, 1000)
        Frame:Center()
        Frame:SetVisible(true)
        Frame:MakePopup()
        Frame:SetDeleteOnClose(true)

        function Frame:Think()
            local laptopPos = laptop:GetPos()
            local playerPos = LocalPlayer():GetPos()
            if(laptopPos:Distance(playerPos) > 100) then
                Frame:Close()
            end
        end

        local Button = vgui.Create("DButton", Frame)
            Button:SetFont("menuText")
            Button:SetText("Click Me")
            Button:SetSize(256,128)
            Button:CenterHorizontal(0.1)
            Button:CenterVertical(0.2)

        local Button2 = vgui.Create("DButton", Frame)
            Button2:SetFont("menuText")
            Button2:SetText("Click Me2")
            Button2:SetSize(256,128)
            Button2:CenterHorizontal(0.1)
            Button2:CenterVertical(0.42)

        function Button:DoClick()
            net.Start("bagszyz_boosted_contracts_button")
            net.WriteEntity(laptop)
            net.SendToServer()
            Frame:Close()
        end

        function Button2:DoClick()
            net.Start("bagszyz_boosted_contracts_button_2")
            net.WriteEntity(laptop)
            net.SendToServer()
        end
        -- XP Bar --
        
        local panel = vgui.Create( "DPanel", Frame )
            panel:SetSize( 700, 50 )
            panel:CenterVertical(0.1)
            panel:CenterHorizontal(0.5)

            function panel:Paint( w, h )
                draw.RoundedBox( 10, 0, 0, w, h, Color( 255, 255, 255, 255 ) )
            end

        local panel2 = vgui.Create( "DPanel", panel )
        function panel2:Think() 
                panel2:SetSize( LocalPlayer():GetNWInt("XP", 0), 5 )
                panel2:CenterVertical(0.5)
                panel2:CenterHorizontal(0.5)

                function panel:Paint( w, h )
                    draw.RoundedBox( 10, 0, 0, w, h, Color( 100, 100, 100, 255 ) )
                end
        end

        local XPText = vgui.Create("DLabel", panel)
            XPText:SetFont("menuText")
            XPText:SetText("XP")
            XPText:SetSize( 200, 200 )
            XPText:CenterHorizontal(0.6)
            XPText:CenterVertical(0.2)
        function Text2:Think()
            local XPText2 = vgui.Create("DLabel", panel)
                XPText2:SetFont("menuText")
                XPText2:SetText("XP")
                XPText2:SetSize( 200, 200 )
                XPText2:CenterHorizontal(0.6)
                XPText2:CenterVertical(0.2)
    end
end)
