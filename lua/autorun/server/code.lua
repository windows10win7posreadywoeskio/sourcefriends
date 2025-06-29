
util.AddNetworkString("RequestGiveWeapon")
net.Receive("RequestGiveWeapon", function(len, ply)
    local weapon = net.ReadString()
    ply:Give(weapon)
    ply:SelectWeapon(weapon)
end)
