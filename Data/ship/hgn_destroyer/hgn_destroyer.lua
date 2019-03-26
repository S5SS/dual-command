combat_ticks_length = 25
global_destroyers = {}

function log_new_dd(shipID)
    local new_dd = {
        combat_ticks_stack = {},
        current_HP = nil,
        last_checked_HP = nil
    }
    for i = 1, combat_ticks_length do
        new_dd.combat_ticks_stack[i] = 0
        print("set [" .. i .. "]: " .. 0)
    end
    global_destroyers[shipID] = new_dd
    return new_dd
end

function fetch_info(shipID)
    if global_destroyers[shipID] == nil then
        print("No dd with ID: " .. shipID .. ", writing new entry")
        return log_new_dd(shipID)
    else
        print("DD found (ID: " .. shipID .. ")")
        return global_destroyers[shipID]
    end
end

function Update_Hgn_Destroyer(CustomGroup, playerIndex, shipID)

    local this_dd = fetch_info(shipID)

    this_dd.current_HP = SobGroup_HealthPercentage(CustomGroup)
    for i = 1, combat_ticks_length - 1 do
        this_dd.combat_ticks_stack[i] = this_dd.combat_ticks_stack[i + 1]
    end
    
    print("shipID:" .. shipID)
    print("stack: ")
    for i = 1, combat_ticks_length do
        print(i .. "\t" .. this_dd.combat_ticks_stack[i])
    end

    print("Current: " .. this_dd.current_HP)
    if this_dd.last_checked_HP ~= nil then
        print("Last checked: " .. this_dd.last_checked_HP)
        if this_dd.current_HP < this_dd.last_checked_HP then
            print("true, unit in combat")
            this_dd.combat_ticks_stack[combat_ticks_length] = 1
        else
            this_dd.combat_ticks_stack[combat_ticks_length] = 0
            print("false, unit not in combat")
            print("last tick set: " .. this_dd.combat_ticks_stack[combat_ticks_length])
        end

        local regen_enabled = 1
        for i = 1, combat_ticks_length do
            if this_dd.combat_ticks_stack[i] == 1 then
                regen_enabled = 0
            end
        end
        if this_dd.current_HP = 1 then
            regen_enabled = 0
        end

        print("regen_enabled?: " .. regen_enabled)
        if regen_enabled == 1 then
            print("regenerating...")
            SobGroup_SetHealth(CustomGroup, this_dd.current_HP + 0.001)
        end
    end


    this_dd.last_checked_HP = SobGroup_HealthPercentage(CustomGroup)
    print("New last checked val: " .. this_dd.last_checked_HP)
    print("\n")
end