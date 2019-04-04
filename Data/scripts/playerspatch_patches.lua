inhibitors = {}

function Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	-- Hack to disable scuttle while a unit is being dropped off by salvage corvettes
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end

function Update_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	-- This adds/removes a ship to the table of inhibitors if it is currently inhibiting hyperspace
	inhibitors[CustomGroup] = SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceInhibitor) == 1 or nil
end

-- This combined function is somewhat redundant however it makes it so that not all ships need a Lua file
-- This is because you can only have one update function per call to addCustomCode IIRC
function Update_NoSalvageScuttleHyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	Update_HyperspaceInhibitor
end

function Destroy_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	inhibitors[CustomGroup] = nil
end
