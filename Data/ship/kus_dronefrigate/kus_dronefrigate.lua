function SobGroup_AnyBeingCaptured(group)
	local group_being_captured = group .. "_being_captured"
	SobGroup_CreateIfNotExist(group_being_captured)
	SobGroup_Clear(group_being_captured)
	SobGroup_GetSobGroupBeingCapturedGroup(group, group_being_captured)
	if (SobGroup_Count(group_being_captured) > 0) then
		return 1
	end
	return 0
end

function Start_DroneFrigate(CustomGroup, playerIndex, shipID) 
	SobGroup_SetSpeed(CustomGroup, 0.9)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "dronelaunch_sfx"..r)
end

function Do_DroneFrigate(CustomGroup, playerIndex, shipID)  	
	SobGroup_CreateIfNotExist("dronefrigate_temp")
	SobGroup_CreateIfNotExist("dronefrigate_temp1")	
	for k = 0,13,1 do
		SobGroup_CreateIfNotExist("kus_drone" .. tostring(shipID) .. tostring(k))		
		SobGroup_Clear("dronefrigate_temp")
		SobGroup_Clear("dronefrigate_temp1")
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "dronefrigate_temp")
		SobGroup_FillShipsByType("dronefrigate_temp1", "dronefrigate_temp", "kus_drone"..k)
		SobGroup_SobGroupAdd("kus_drone" .. tostring(shipID) .. tostring(k), "dronefrigate_temp1")
		if SobGroup_Count("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 0 and
			SobGroup_AreAllInRealSpace(CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 0 and
			SobGroup_AnyBeingCaptured(CustomGroup) == 0 then
			local CreateGroup = SobGroup_CreateShip(CustomGroup, "kus_drone"..k)
			SobGroup_SobGroupAdd("kus_drone" .. tostring(shipID) .. tostring(k), CreateGroup)
			if k == 0 or k == 4 or k == 8 or k == 12 then
				FX_StartEvent(CustomGroup, "dronelaunch1")
			elseif k == 1 or k == 5 or k == 9 or k == 13 then
				FX_StartEvent(CustomGroup, "dronelaunch2")
			elseif k == 2 or k == 6 or k == 10 then	
				FX_StartEvent(CustomGroup, "dronelaunch3")
			elseif k == 3 or k == 7 or k == 11 then	
				FX_StartEvent(CustomGroup, "dronelaunch4")
			end
			break
		else
			--SobGroup_SwitchOwner("kus_drone" .. tostring(shipID) .. tostring(k), playerIndex)
			if SobGroup_IsDockedSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 0 and
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 0 and
			SobGroup_AreAllInRealSpace(CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 0 and
			SobGroup_AnyBeingCaptured(CustomGroup) == 0 then
				SobGroup_Launch("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
				if k == 0 or k == 4 or k == 8 or k == 12 then
					FX_StartEvent(CustomGroup, "dronelaunch1")
				elseif k == 1 or k == 5 or k == 9 or k == 13 then
					FX_StartEvent(CustomGroup, "dronelaunch2")
				elseif k == 2 or k == 6 or k == 10 then	
					FX_StartEvent(CustomGroup, "dronelaunch3")
				elseif k == 3 or k == 7 or k == 11 then	
					FX_StartEvent(CustomGroup, "dronelaunch4")
				end
				break
			end				
		end			
	end		
end

function Finish_DroneFrigate(CustomGroup, playerIndex, shipID)	
	SobGroup_SetSpeed(CustomGroup, 1)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "droneretract_sfx"..r)
	for k = 0,13,1 do
		if SobGroup_Empty("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 0)
			SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 0)
			SobGroup_DockSobGroupAndStayDocked("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
		end	
	end	
end

-----------------------------------------------------------------------------------

function Create_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_SetSwitchOwnerFlag(CustomGroup, 0)
	SobGroup_CreateIfNotExist("dronefrigate_temp")
	SobGroup_CreateIfNotExist("dronefrigate_temp1")

	SobGroup_CreateIfNotExist("attack_targets" .. shipID)
	for k = 0,13,1 do
		local new_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		SobGroup_CreateIfNotExist(new_drone)	
	end
end

function Update_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_AbilityActivate(CustomGroup, AB_Scuttle, 1 - SobGroup_IsDoingAbility(CustomGroup, AB_Dock))

	if Player_GetLevelOfDifficulty(playerIndex) > 0 then
		local playerIndex_ai = 0		
		local enemyships = 0
		while playerIndex_ai < Universe_PlayerCount() do
			if Player_IsAlive(playerIndex_ai) == 1 then								
				local distance = 4000
				if SobGroup_FillProximitySobGroup("dronefrigate_temp1", "Player_Ships"..playerIndex_ai, CustomGroup, distance) == 1 then									
					if AreAllied(playerIndex, playerIndex_ai) == 0 then						
						enemyships = 1
					end					
				end				
			end
			playerIndex_ai = playerIndex_ai + 1
		end
		if enemyships > 0 then
			if SobGroup_IsDoingAbility(CustomGroup, AB_Custom) == 0 then
				SobGroup_CustomCommand(CustomGroup)
			end
		end
	end
	for k = 0, 13, 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		print("updating drone " .. k)
		print("\t" ..  this_drone)
		SobGroup_SetROE(this_drone, SobGroup_GetROE(CustomGroup))
		if SobGroup_Empty(this_drone) == 0 then
			if SobGroup_IsDockedSobGroup(this_drone, CustomGroup) == 0 and
			SobGroup_IsDoingAbility(this_drone, AB_Parade) == 0 and
			SobGroup_IsDoingAbility(this_drone, AB_Dock) == 0 then
				if (SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) < 150 or
				SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > 230) then
					SobGroup_ParadeSobGroup(this_drone, CustomGroup, 0) -- reform parade around frigate
				end
			end
			if SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > 950 then -- too far from frigate, die
				SobGroup_TakeDamage(this_drone, 1)
			elseif SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > 275 then -- too far from frigate, no attack
				SobGroup_AbilityActivate(this_drone, AB_Targeting, 0)
				SobGroup_AbilityActivate(this_drone, AB_Attack, 0)
			else
				SobGroup_AbilityActivate(this_drone, AB_Targeting, 1) -- distance ok, allow targeting and attacking, begin guard of frigate
				SobGroup_AbilityActivate(this_drone, AB_Attack, 1)
				if (SobGroup_IsDoingAbility(this_drone, AB_Guard) == 0) then
					SobGroup_GuardSobGroup (this_drone, CustomGroup)
				end
			end			
			if SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 1 or
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 1 or
			SobGroup_AreAllInRealSpace(CustomGroup) == 0 or
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 1 or			
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 1 or
			SobGroup_AnyBeingCaptured(CustomGroup) > 0 or
			SobGroup_OwnedBy("kus_drone" .. tostring(shipID) .. tostring(k)) ~= playerIndex then					
				SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
				--SobGroup_DockSobGroupInstant("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
			end

			if SobGroup_IsDoingAbility(CustomGroup, AB_Attack) == 1 then
				SobGroup_GetCommandTargets("attack_targets" .. shipID, CustomGroup, COMMAND_Attack)
				SobGroup_Attack(playerIndex, this_drone, "attack_targets" .. shipID)
			elseif SobGroup_IsDoingAbility(CustomGroup, AB_Attack) == 0 then
					SobGroup_AbilityActivate(this_drone, AB_Attack, 0)
					SobGroup_AbilityActivate(this_drone, AB_Targeting, 0)
			end
		end	
	end	
end

function Destroy_DroneFrigate(CustomGroup, playerIndex, shipID)	
	for k = 0,13,1 do
		if SobGroup_Empty("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
		end	
	end
end

function SobGroup_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return 0
	end
end