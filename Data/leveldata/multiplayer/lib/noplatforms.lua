
function noplatforms_init()
		local playerIndex = 0		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								Player_RestrictBuildOption(playerIndex, "PlatformProduction")
								Player_RestrictBuildOption(playerIndex, "Hgn_GunTurret")
								Player_RestrictBuildOption(playerIndex, "Hgn_IonTurret")
								Player_RestrictBuildOption(playerIndex, "Vgr_WeaponPlatform_Gun")
								Player_RestrictBuildOption(playerIndex, "Vgr_WeaponPlatform_Missile")
								Player_RestrictBuildOption(playerIndex, "Vgr_Hyperspace_Platform")
						end
				end
		end	
		Rule_Remove("noplatforms_init")		
end