dofilepath("data:scripts/playesrpatch_patches")

function Create_Hgn_Mothership(CustomGroup, playerIndex, shipID) 	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
	end
end

function Update_Hgn_Mothership(CustomGroup, playerIndex, shipID)	
	-- Cant be salvaged so no need to check for it
	Update_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
end

function Destroy_Hgn_Mothership(CustomGroup, playerIndex, shipID)
	Destroy_HyperspaceInhibitor(CustomGroup, playerIndex, shipID)
end