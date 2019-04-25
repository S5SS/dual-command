dofilepath("data:scripts/playerspatch_patches.lua")

function Update_Hgn_Interceptor(CustomGroup, playerIndex, shipID)
    PlayersPatch_UnderAttackReissueDock(CustomGroup)
end