function isRace2x(raceId)
	return raceId == 2 or -- Hiigaran_2X
	       raceId == 4 or -- Vaygr_2X
	       raceId == 6 or -- Kushan_2X
	       raceId == 8    -- Taiidan_2X
end

function dualcommand_init()
	master = nil
	slave = nil
	
	-- Loop through players to find master and slave
	for player=0,Universe_PlayerCount()-1 do
		if isRace2x(Player_GetRace(player)) then
			-- The master must be a player and the slave must be an AI
			if Player_GetLevelOfDifficulty(player) > 0 then
				slave = player
			else
				master = player
			end
		end
	end
	
	-- If both a master and slave are found
	if master and slave then
		-- Give all slave player units to master
		SobGroup_CreateIfNotExist("SlaveShips")
		SobGroup_CreateIfNotExist("SlaveCollectors")
		
		SobGroup_SobGroupAdd("SlaveShips", "Player_Ships" .. slave)
		SobGroup_GetSobGroupDockedWithGroup("SlaveShips", "SlaveCollectors") -- Player_Ships does not include these collectors
		SobGroup_SobGroupAdd("SlaveShips", "SlaveCollectors")
		
		-- Switch owner
		SobGroup_SetSwitchOwnerFlag("SlaveShips", 0)
		SobGroup_SwitchOwner("SlaveShips", master)
		
		-- Give player double rus
		Player_SetRU(master, Player_GetRU(master) * 2)
		Rule_Remove("dualcommand_init")
	end
end
