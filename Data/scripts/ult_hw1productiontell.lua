-- tech exposure (2.4) [Fear]
-- called infrequently, don't care about not running this code if its redundant
function Ult_BuildNecessaryProductionTells(CustomGroup, playerIndex)
	if (Player_HasResearch(playerIndex, "FighterChassis") == 1) then -- int/bomber tech
		SobGroup_CreateSubSystem(CustomGroup, "FighterProduction")
	end
	if (Player_HasResearch(playerIndex, "CorvetteDrive") == 1) then -- light vettes
		SobGroup_CreateSubSystem(CustomGroup, "CorvetteProduction")
	end
	if (Player_HasResearch(playerIndex, "CapitalShipDrive") == 1) then -- supp frigates
		SobGroup_CreateSubSystem(CustomGroup, "FrigateProduction")
	end
	if (Player_HasResearch(playerIndex, "SuperCapitalShipDrive") == 1) then -- carriers
		SobGroup_CreateSubSystem(CustomGroup, "CapShipProduction")
	end
end