--[[
	SCRIPT AUTHOR: cshonza #0507
	AUTHOR'S GITHUB: https://github.com/cshonza
	INFO: This script will remove drops from NPC's and guns from car/helicopters and it's optimalised
]]--

function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
			if not IsEntityDead(ped) then
				SetPedDropsWeaponsWhenDead(ped, false)
			end
			finished, ped = FindNextPed(handle)
	until not finished
	
	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)
	end
end)

