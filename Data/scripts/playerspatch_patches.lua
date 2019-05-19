-- Doesn't appear to be global across units
-- inhibitors = {}

function Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	-- Hack to disable scuttle while a unit is being dropped off by salvage corvettes
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end

-- EXPERIIMENTAL
function Update_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	-- -- This adds/removes a ship to the table of inhibitors if it is currently inhibiting hyperspace
	--inhibitors[CustomGroup] = SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceInhibitor) == 1 or nil
	--InhibitHyperspaceLocal(CustomGroup, playerIndex, shipID)
	--inhibitHyperspaceGlobal()
end

-- EXPERIIMENTAL
function Destroy_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	--inhibitors[CustomGroup] = nil
	--InhibitHyperspaceLocal(CustomGroup, playerIndex, shipID)
	--inhibitHyperspaceGlobal()
end

-- This combined function is somewhat redundant however it makes it so that not all ships need a Lua file
-- This is because you can only have one update function per call to addCustomCode IIRC
function Update_NoSalvageScuttleHyperspaceInhibitor(CustomGroup, playerIndex, shipID)
	Update_NoSalvageScuttle(CustomGroup, playerIndex, shipID)
	--Update_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
end

-- Iterate through all hyperspace inhibitors in the inhibitors table and add them to a SobGroup
-- This is specific to each unit class
function InhibitHyperspaceLocal(CustomGroup, playerIndex, shipID)
	-- inhibitorRadius = 10500
	
	-- -- Initialize SobGroups
	-- inhibitedUnits = "inhibitedUnits_" .. shipID
	-- inhibitedUnitsBuffer = "inhibitedUnitsBuffer_" .. shipID
	-- sobs = {inhibitedUnits, inhibitedUnitsBuffer}
	-- for _, sob in sobs do SobGroup_CreateIfNotExist(sob); SobGroup_Clear(sob) end
	
	-- -- Add all non allied units to unit class specific inhibited units buffer
	-- for player=0,Universe_PlayerCount()-1 do
		-- for inhibitor, _ in inhibitors do
			-- --if AreAllied(SobGroup_OwnedBy(inhibitor), player) == 0 then
				-- Player_FillProximitySobGroup(inhibitedUnitsBuffer, player, inhibitor, inhibitorRadius)
				-- SobGroup_SobGroupAdd(inhibitedUnits, inhibitedUnitsBuffer)
			-- --end
		-- end
	-- end
end

function inhibitHyperspaceGlobal()
	-- -- List of all units that can inhibit hyperspace
	-- unitClasses = {"hgn_carrier", "hgn_mothership", "hgn_battlecruiser", "hgn_shipyard",
	               -- "vgr_carrier", "vgr_mothership", "vgr_battlecruiser", "vgr_shipyard",
				   -- "kus_gravwellgenerator", "tai_gravwellgenerator"}
	
	-- -- Initialize SobGroups
	-- sobs = {"allUnits", "inhibitedUnits", "uninhibitedUnits"}
	-- for _, sob in sobs do SobGroup_CreateIfNotExist(sob); SobGroup_Clear(sob) end
	-- for _, class in unitClasses do SobGroup_CreateIfNotExist("inhibitedUnits_" .. class) end
	
	-- -- Get all units
	-- for player=0,Universe_PlayerCount()-1 do
		-- SobGroup_SobGroupAdd("allUnits", "Player_Ships" .. player)
	-- end
	
	-- -- Get all inhibited units
	-- for _, class in unitClasses do
		-- SobGroup_SobGroupAdd("inhibitedUnits", "inhibitedUnits_" .. class)
	-- end
	
	-- SobGroup_FillSubstract("uninhibitedUnits", "allUnits", "inhibitedUnits")
	
	-- SobGroup_AbilityActivate("inhibitedUnits", AB_Hyperspace, 0)
	-- SobGroup_AbilityActivate("uninhibitedUnits", AB_Hyperspace, 1)
end

function PlayersPatch_UnderAttackReissueDock(group)
	if (SobGroup_IsDocked(group) == 0) then -- no member of this squad is docked
		if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then -- en route to dock
			if (SobGroup_UnderAttack(group)) then -- under attack
				if (SobGroup_Count(group) < SobGroup_GetStaticF(group, "buildBatch")) then -- lost one or more members
					if (SobGroup_GetActualSpeed(group) < 50) then -- probably bugged into stopping - could get unlucky here and catch a pivoting squad
						SobGroup_DockSobGroupWithAny(group)
					end
				end
			end
		end
	end
end

-- tech exposure (2.4) [Fear]
-- called infrequently, don't care about not running this code if its redundant
function PlayersPatch_BuildNecessaryProductionTells(CustomGroup, playerIndex)
	if Player_HasResearch(playerIndex, "FighterChassis") == 1 or Player_HasResearch(playerIndex, "DefenderSubSystems") == 1 then -- int/bomber tech, defender tech
		SobGroup_CreateSubSystem(CustomGroup, "FighterProduction")
	end
	if Player_HasResearch(playerIndex, "CorvetteDrive") == 1 then -- light vettes
		SobGroup_CreateSubSystem(CustomGroup, "CorvetteProduction")
	end
	if Player_HasResearch(playerIndex, "CapitalShipDrive") == 1 then -- supp frigates
		SobGroup_CreateSubSystem(CustomGroup, "FrigateProduction")
	end
	if Player_HasResearch(playerIndex, "SuperCapitalShipDrive") == 1 then -- carriers
		SobGroup_CreateSubSystem(CustomGroup, "CapShipProduction")
	end
end
