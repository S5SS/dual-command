function Create_Hgn_Carrier(CustomGroup, playerIndex, shipID)  
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
		end
	end	
end

function Update_Hgn_Carrier(CustomGroup, playerIndex, shipID)
	--SobGroup_CreateIfNotExist("hgn_carrier"..playerIndex)
	--SobGroup_Clear("hgn_carrier"..playerIndex)
	--SobGroup_SobGroupAdd("hgn_carrier"..playerIndex, CustomGroup)
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))
end