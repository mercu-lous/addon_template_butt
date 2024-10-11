-- LinkLuaModifier("modifier_merc_movespeed_cap_increase", "modifier_merc_movespeed_cap_increase.lua", LUA_MODIFIER_MOTION_NONE)

merc_movespeed_cap_increase = class({})

function merc_movespeed_cap_increase:GetIntrinsicModifierName()
    return "modifier_item_force_boots"
end
