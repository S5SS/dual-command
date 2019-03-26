last_checked_HP = 1
combat_ticks_length = 25
combat_ticks_stack = { }
for i = 1, combat_ticks_length do
    combat_ticks_stack[i] = 0
end

function Update_Hgn_Destroyer(CustomGroup, playerIndex, shipID)
    local current_HP = SobGroup_HealthPercentage(CustomGroup)
    for i = 1, combat_ticks_length - 1 do
        combat_ticks_stack[i] = combat_ticks_stack[i + 1]
    end

    print("stack: ")
    for i = 1, combat_ticks_length do
        print("\t" .. combat_ticks_stack[i])
    end

    print("Current: " .. current_HP)
    print("Last checked: " .. last_checked_HP)
    if current_HP < last_checked_HP then
        print("true, unit in combat")
        combat_ticks_stack[combat_ticks_length] = 1
    else
        combat_ticks_stack[combat_ticks_length] = 0
    end

    local regen_enabled = 1
    for i = 1, combat_ticks_length do
        if combat_ticks_stack[i] == 1 then
            regen_enabled = 0
        end
    end

    print("regen_enabled?: " .. regen_enabled)
    if regen_enabled == 1 then
        print("regenerating...")
        SobGroup_SetHealth(CustomGroup, current_HP + 0.001)
    end

    last_checked_HP = SobGroup_HealthPercentage(CustomGroup)
    print("New last checked val: " .. last_checked_HP)
    print("\n")
end