dofilepath("data:scripts/playerspatch_patches.lua")

function Update_Vgr_Interceptor(CustomGroup, playerIndex, shipID)
    PlayersPatch_UnderAttackReissueDock(CustomGroup)
end