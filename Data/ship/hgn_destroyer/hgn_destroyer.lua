-- variables here are stored globally and are accessable via this script regardless of invokation time
-- as such we need a persistant dictionary to identify which DD info we want to work with
combat_ticks_length = 25
global_destroyers = {}

-- init a new entry
function log_new_dd(shipID)
    local new_dd = {
        combat_ticks_queue = {},
        current_HP = nil,
        last_checked_HP = nil,
        ticks_since_last_fx = 0
    }
    for i = 1, combat_ticks_length do
        new_dd.combat_ticks_queue[i] = 0
    end
    global_destroyers[shipID] = new_dd
    return new_dd
end

-- get if exists, otherwise create new and return
function fetch_info(shipID)
    if global_destroyers[shipID] == nil then
        return log_new_dd(shipID)
    else
        return global_destroyers[shipID]
    end
end

-- main loop
-- We store the destroyer's combat status as the last entry of an N-length queue,
-- and every update (every r seconds), this value is moved down the queue.
-- If the entire queue contains a non-combat status (0), the ship will begin regerating
-- at an accelerated pace.
-- The time taken for a destroyer to begin regenerating is therefore N * r.
-- 
-- This is done to ensure granularity - consider the case where we check a descrete time-block
-- for combat. If we check every 5 seconds, then a destroyer which took damage 4.9 seconds ago
-- and a destroyer which took damage 0.1 seconds ago will both fail that check and must wait
-- an additional 5 seconds, resulting in an unfair wait time
-- To mitigate this, we could reduce the timeframe. However this obviously has a huge drawback in
-- that there is no way to control a reasonable time after taking damage in which to start healing.
--
-- However we can combine the granularity of the rapid-checking and the controllable nature of
-- long-checking by rapidly checking into a queue (granularity), but requiring a totally clean
-- queue for regeneration to kick in (controllability).
function Update_Hgn_Destroyer(CustomGroup, playerIndex, shipID)

    local this_dd = fetch_info(shipID)

    this_dd.current_HP = SobGroup_HealthPercentage(CustomGroup)
    for i = 1, combat_ticks_length - 1 do
        this_dd.combat_ticks_queue[i] = this_dd.combat_ticks_queue[i + 1]
    end
    
    if this_dd.last_checked_HP ~= nil then
        if this_dd.current_HP < this_dd.last_checked_HP then
            this_dd.combat_ticks_queue[combat_ticks_length] = 1
        else
            this_dd.combat_ticks_queue[combat_ticks_length] = 0
        end

        local regen_enabled = 1
        for i = 1, combat_ticks_length do
            if this_dd.combat_ticks_queue[i] == 1 then
                regen_enabled = 0
            end
        end
        if this_dd.current_HP == 1 then
            regen_enabled = 0
        end

        if regen_enabled == 1 then
            -- glow effect every 10 calls
            this_dd.ticks_since_last_fx = this_dd.ticks_since_last_fx + 1
            if this_dd.ticks_since_last_fx == 10 then
                FX_PlayEffect("mine_clear_glow_ring", CustomGroup, 10)
                this_dd.ticks_since_last_fx = 0
            end
            -- with an update freq of 0.2, repairing 0.01 (1/100) hp per second
            SobGroup_SetHealth(CustomGroup, this_dd.current_HP + 0.002)
        end
    end


    this_dd.last_checked_HP = SobGroup_HealthPercentage(CustomGroup)
end

function Destroy_Hgn_Destroyer(CustomGroup, playerIndex, shipID)
    global_destroyers[shipID] = nil
end