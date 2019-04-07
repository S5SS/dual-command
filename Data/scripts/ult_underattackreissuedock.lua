function Ult_UnderAttackReissueDock(group)
    if (SobGroup_GetCurrentOrder(group) == COMMAND_Dock) then
        if (SobGroup_UnderAttack(group)) then
            SobGroup_DockSobGroupWithAny(group)
        end
    end
end