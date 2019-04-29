
function dualcommand_init()
	-- Give all slave player units to master
	SobGroup_Create("SlaveShips")
	SobGroup_Create("SlaveCollectors")
	SobGroup_SobGroupAdd("SlaveShips", "Player_Ships" .. dualcommand_slave)
	SobGroup_GetSobGroupDockedWithGroup("SlaveShips", "SlaveCollectors") -- Player_Ships does not include these collectors
	SobGroup_SobGroupAdd("SlaveShips", "SlaveCollectors")
	SobGroup_SetSwitchOwnerFlag("SlaveShips", 0)
	SobGroup_SwitchOwner("SlaveShips", dualcommand_master)
	
	-- Give player double rus
	Player_SetRU(dualcommand_master, Player_GetRU(dualcommand_master) * 2)
	Rule_Remove("dualcommand_init")		
	research = {}
end
