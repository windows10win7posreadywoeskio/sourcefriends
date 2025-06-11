SWEP.PrintName = "Take Picture!!"
SWEP.Category = "sourcefriends"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.SwayScale = 20


SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.UseHands = false
SWEP.ViewModel = "models/editor/camera.mdl"
SWEP.WorldModel = "models/editor/camera.mdl"

function SWEP:Initialize()
    self:SetHoldType("pistol")
    
end

hook.Add("InitPostEntity", "TakePictureVGUI", function()
            local ply = LocalPlayer()
            if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "srcfrnd_takepicture" then
                if IsValid(TakePicturePanel) then TakePicturePanel:Remove() end

                local TakePicturePanel = vgui.Create("DPanel")
                TakePicturePanel:SetSize(240, 60)
                TakePicturePanel:SetPos(10, 10)
                TakePicturePanel:SetBackgroundColor(Color(0, 0, 0, 112))

                local label = vgui.Create("DLabel", TakePicturePanel)
                label:SetText("Take Picture")
                label:SetFont("Arial", 24)
                label:SetTextColor(Color(255,255,255))
                label:SizeToContents()
                label:SetPos((TakePicturePanel:GetWide() - label:GetWide()) / 2, (TakePicturePanel:GetTall() - label:GetTall()) / 2)
            end
        end)

    function SWEP:PrimaryAttack()
        if SERVER then
            self:GetOwner():ConCommand("jpeg srcfrnd_screenshot0")
        end
    end