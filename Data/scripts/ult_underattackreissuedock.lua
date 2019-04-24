function Ult_UnderAttackReissueDock(group)
    if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then -- docking
        if (SobGroup_UnderAttack(group)) then -- under attack
            if (SobGroup_Count(group) < SobGroup_GetStaticF(group, "buildBatch")) then -- lost one or more members
                if (SobGroup_GetActualSpeed(group) < 50) then -- probably bugged into stopping - could get unlucky here and catch a pivoting squad
                    SobGroup_DockSobGroupWithAny(group)
                end
            end
        end
    end
end