if SERVER then
    AddCSLuaFile()
end

SWEP.PrintName = "frend spawner"
SWEP.Category = "sourcefriends"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.SwayScale = 0
--SWEP.BobScale = 1

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

function SWEP:Initialize()
    self:SetHoldType("pistol")
    self.entname = "friend"
end
function SWEP:PrimaryAttack()
    if CLIENT then return end

    local owner = self:GetOwner()
    local tr = owner:GetEyeTrace()
    local pos = owner:GetShootPos() + owner:GetAimVector() * 64

    local ent = ents.Create("friend")
    if not IsValid(ent) then return end

    ent:EmitSound("hl1/fvox/bell.wav", 75, 50)

    owner:SetAnimation(PLAYER_ATTACK1)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    ent:SetPos(pos)
    ent:Spawn()
    
    ent:Activate()
    --ent:SetModel("models/player/kleiner.mdl")
    ent:SetName("frend")
end