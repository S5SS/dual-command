function Update_No_Salvage_Scuttle(CustomGroup, playerIndex, shipID)
	-- hack to disable scuttle while a unit is being dropped off by salvage corvettes
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end