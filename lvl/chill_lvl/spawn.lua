local j = nil
local esa = ''
local armor = ''
local health = ''
local kozak = ''
local bron = ''

local team = {{name = "frajer", model = "s_m_y_cop_01"},}
local team1 = {{name = "frajer", model = "mp_m_fibsec_01"},}
local team2 = {{name = "frajer", model = "s_m_y_swat_01"}}

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

bots = function()
    local totalPeople = tonumber(esa)
    for i=1,totalPeople, 1 do
        j = math.random(1,#kozak)
        local ped = GetHashKey(kozak[j].model)
        RequestModel(ped)
        while not HasModelLoaded(ped) do 
            Citizen.Wait(1)
        end
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        newPed = CreatePed(4, ped, x+math.random(-totalPeople,totalPeople),y+math.random(-totalPeople,totalPeople), z, 0.0, false, true)
        SetPedCombatAttributes(newPed, 0, true)
        SetPedCombatAttributes(newPed, 5, true)
        SetPedCombatAttributes(newPed, 46, true)
        SetPedFleeAttributes(newPed, 0, true)

        if (kozak[j].name) == "frajer" then
            SetPedAccuracy(newPed, 1)
            SetRelationshipBetweenGroups(5, GetHashKey(kozak[j].name), GetHashKey('PLAYER'))
            SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), GetHashKey(kozak[j].name))
        end
        GiveWeaponToPed(newPed, GetHashKey(bron), 2000, true, true)
        SetPedArmour(newPed, armor)
        SetPedMaxHealth(newPed, health)
    end
end

RegisterCommand("lvl1", function()
    esa = 5
    armor = 25
    health = 100
    bron = 'weapon_snspistol'
    kozak = team
    bots()
end)

RegisterCommand("lvl2", function()
    esa = 5
    armor = 50
    health = 100
    bron = 'weapon_pistol50'
    kozak = team1
    bots()
end)

RegisterCommand("lvl3", function()
    esa = 5
    armor = 100
    health = 100
    bron = 'weapon_carbinerifle'
    kozak = team2
    bots()
end)

RegisterCommand("lvl4", function()
    esa = 5
    armor = 100
    health = 100
    bron = 'weapon_pumpshotgun'
    kozak = team2
    bots()
end)

RegisterCommand("lvl5", function()
    esa = 10
    armor = 25
    health = 100
    bron = 'weapon_snspistol'
    kozak = team
    bots()
end)

RegisterCommand("lvl6", function()
    esa = 10
    armor = 50
    health = 100
    bron = 'weapon_pistol50'
    kozak = team1
    bots()
end)

RegisterCommand("lvl7", function()
    esa = 10
    armor = 100
    health = 100
    bron = 'weapon_carbinerifle'
    kozak = team2
    bots()
end)

RegisterCommand("lvl8", function()
    esa = 10
    armor = 100
    health = 100
    bron = 'weapon_pumpshotgun'
    kozak = team2
    bots()
end)

RegisterCommand("lvl0", function()
    isDeath()
end)

Citizen.CreateThread(function()

local pickupList = {"PICKUP_AMMO_BULLET_MP","PICKUP_AMMO_FIREWORK","PICKUP_AMMO_FLAREGUN","PICKUP_AMMO_GRENADELAUNCHER","PICKUP_AMMO_GRENADELAUNCHER_MP","PICKUP_AMMO_HOMINGLAUNCHER","PICKUP_AMMO_MG","PICKUP_AMMO_MINIGUN","PICKUP_AMMO_MISSILE_MP","PICKUP_AMMO_PISTOL","PICKUP_AMMO_RIFLE","PICKUP_AMMO_RPG","PICKUP_AMMO_SHOTGUN","PICKUP_AMMO_SMG","PICKUP_AMMO_SNIPER","PICKUP_ARMOUR_STANDARD","PICKUP_CAMERA","PICKUP_CUSTOM_SCRIPT","PICKUP_GANG_ATTACK_MONEY","PICKUP_HEALTH_SNACK","PICKUP_HEALTH_STANDARD","PICKUP_MONEY_CASE","PICKUP_MONEY_DEP_BAG","PICKUP_MONEY_MED_BAG","PICKUP_MONEY_PAPER_BAG","PICKUP_MONEY_PURSE","PICKUP_MONEY_SECURITY_CASE","PICKUP_MONEY_VARIABLE","PICKUP_MONEY_WALLET","PICKUP_PARACHUTE","PICKUP_PORTABLE_CRATE_FIXED_INCAR","PICKUP_PORTABLE_CRATE_UNFIXED","PICKUP_PORTABLE_CRATE_UNFIXED_INCAR","PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL","PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW","PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE","PICKUP_PORTABLE_PACKAGE","PICKUP_SUBMARINE","PICKUP_VEHICLE_ARMOUR_STANDARD","PICKUP_VEHICLE_CUSTOM_SCRIPT","PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW","PICKUP_VEHICLE_HEALTH_STANDARD","PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW","PICKUP_VEHICLE_MONEY_VARIABLE","PICKUP_VEHICLE_WEAPON_APPISTOL","PICKUP_VEHICLE_WEAPON_ASSAULTSMG","PICKUP_VEHICLE_WEAPON_COMBATPISTOL","PICKUP_VEHICLE_WEAPON_GRENADE","PICKUP_VEHICLE_WEAPON_MICROSMG","PICKUP_VEHICLE_WEAPON_MOLOTOV","PICKUP_VEHICLE_WEAPON_PISTOL","PICKUP_VEHICLE_WEAPON_PISTOL50","PICKUP_VEHICLE_WEAPON_SAWNOFF","PICKUP_VEHICLE_WEAPON_SMG","PICKUP_VEHICLE_WEAPON_SMOKEGRENADE","PICKUP_VEHICLE_WEAPON_STICKYBOMB","PICKUP_WEAPON_ADVANCEDRIFLE","PICKUP_WEAPON_APPISTOL","PICKUP_WEAPON_ASSAULTRIFLE","PICKUP_WEAPON_ASSAULTSHOTGUN","PICKUP_WEAPON_ASSAULTSMG","PICKUP_WEAPON_AUTOSHOTGUN","PICKUP_WEAPON_BAT","PICKUP_WEAPON_BATTLEAXE","PICKUP_WEAPON_BOTTLE","PICKUP_WEAPON_BULLPUPRIFLE","PICKUP_WEAPON_BULLPUPSHOTGUN","PICKUP_WEAPON_CARBINERIFLE","PICKUP_WEAPON_COMBATMG","PICKUP_WEAPON_COMBATPDW","PICKUP_WEAPON_COMBATPISTOL","PICKUP_WEAPON_COMPACTLAUNCHER","PICKUP_WEAPON_COMPACTRIFLE","PICKUP_WEAPON_CROWBAR","PICKUP_WEAPON_DAGGER","PICKUP_WEAPON_DBSHOTGUN","PICKUP_WEAPON_FIREWORK","PICKUP_WEAPON_FLAREGUN","PICKUP_WEAPON_FLASHLIGHT","PICKUP_WEAPON_GRENADE","PICKUP_WEAPON_GRENADELAUNCHER","PICKUP_WEAPON_GUSENBERG","PICKUP_WEAPON_GOLFCLUB","PICKUP_WEAPON_HAMMER","PICKUP_WEAPON_HATCHET","PICKUP_WEAPON_HEAVYPISTOL","PICKUP_WEAPON_HEAVYSHOTGUN","PICKUP_WEAPON_HEAVYSNIPER","PICKUP_WEAPON_HOMINGLAUNCHER","PICKUP_WEAPON_KNIFE","PICKUP_WEAPON_KNUCKLE","PICKUP_WEAPON_MACHETE","PICKUP_WEAPON_MACHINEPISTOL","PICKUP_WEAPON_MARKSMANPISTOL","PICKUP_WEAPON_MARKSMANRIFLE","PICKUP_WEAPON_MG","PICKUP_WEAPON_MICROSMG","PICKUP_WEAPON_MINIGUN","PICKUP_WEAPON_MINISMG","PICKUP_WEAPON_MOLOTOV","PICKUP_WEAPON_MUSKET","PICKUP_WEAPON_NIGHTSTICK","PICKUP_WEAPON_PETROLCAN","PICKUP_WEAPON_PIPEBOMB","PICKUP_WEAPON_PISTOL","PICKUP_WEAPON_PISTOL50","PICKUP_WEAPON_POOLCUE","PICKUP_WEAPON_PROXMINE","PICKUP_WEAPON_PUMPSHOTGUN","PICKUP_WEAPON_RAILGUN","PICKUP_WEAPON_REVOLVER","PICKUP_WEAPON_RPG","PICKUP_WEAPON_SAWNOFFSHOTGUN","PICKUP_WEAPON_SMG","PICKUP_WEAPON_SMOKEGRENADE","PICKUP_WEAPON_SNIPERRIFLE","PICKUP_WEAPON_SNSPISTOL","PICKUP_WEAPON_SPECIALCARBINE","PICKUP_WEAPON_STICKYBOMB","PICKUP_WEAPON_STUNGUN","PICKUP_WEAPON_SWITCHBLADE","PICKUP_WEAPON_VINTAGEPISTOL","PICKUP_WEAPON_WRENCH"}
local pedPos = GetEntityCoords(GetPlayerPed(PlayerId()), false)
    while true do
        Citizen.Wait(1)
            for a = 1, #pickupList do
                if IsPickupWithinRadius(GetHashKey(pickupList[a]), pedPos.x, pedPos.y, pedPos.z, 50.0) then
                    RemoveAllPickupsOfType(GetHashKey(pickupList[a]))
                end
            end
    end
end)