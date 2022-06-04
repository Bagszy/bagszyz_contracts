AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/hunter/blocks/cube075x075x075.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMaterial("models/cs_havana/wndd")
    self:SetUseType(3)
    -- makes physics do physics things --
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
end

function ENT:SpawnFunction(ply, tr, ClassName)
    -- makes it face towards you when spawning --
    if !tr.Hit then return end
    local sp = tr.HitPos + tr.HitNormal * 5
    local PlayerLook = ply:EyeAngles():ToTable()
    local ent = ents.Create("laptop")
    ent:SetPos(sp)
    ent:SetAngles(Angle(0, PlayerLook[2] + 180, 0))
    ent:Spawn()
    ent:Activate()
    return ent
end

util.AddNetworkString("bagszys_boosted_contracts_menu")
util.AddNetworkString("bagszyz_boosted_contracts_button")
util.AddNetworkString("bagszyz_boosted_contracts_button_2")

function ENT:Use(activator, caller)
    if caller:IsPlayer() then
        net.Start("bagszys_boosted_contracts_menu")
        net.WriteEntity(self)
        net.Send(caller)
    end
end

net.Receive("bagszyz_boosted_contracts_button", function(length, player)

    local laptop = net.ReadEntity()

    local ply = Player(2)

        local name = "chargersrt8poltdm"

        local vehicle = list.Get("Vehicles")[name]
        if not vehicle then print("Vehicle name not recognized") return end

        local ent = ents.Create(vehicle.Class)
        if ent and ent:IsValid() then
            ent:SetModel(vehicle.Model)
            ent:SetPos( Vector(-768.128174, 650.663025, -12223.896484))

            for k, v in pairs(vehicle.KeyValues) do
                ent:SetKeyValue(k, v)
            end
        ent:Spawn()
    end

    if(!player:GetNWInt("XP", 0)) then
        player:SetNWInt("XP", 0)
    else
        player:SetNWInt("XP", player:GetNWInt("XP") + 1) 
    end

    print(player:GetNWInt("XP"))
end)

net.Receive("bagszyz_boosted_contracts_button_2", function(length, player)

    local laptop = net.ReadEntity()

    if(!player:GetNWInt("XP", 0)) then
        player:SetNWInt("XP", 0)
    else
        player:SetNWInt("XP", player:GetNWInt("XP") + 55) 
    end

    print(player:GetNWInt("XP"))
end)
