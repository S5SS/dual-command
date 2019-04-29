
function nominelayers_init()
		local playerIndex = 0		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								Player_RestrictBuildOption(playerIndex, "Hgn_MinelayerCorvette")
								Player_RestrictBuildOption(playerIndex, "Vgr_MinelayerCorvette")
								Player_RestrictBuildOption(playerIndex, "Kus_MinelayerCorvette")
								Player_RestrictBuildOption(playerIndex, "Tai_MinelayerCorvette")
						end
				end
		end	
		Rule_Remove("nominelayers_init")		
end