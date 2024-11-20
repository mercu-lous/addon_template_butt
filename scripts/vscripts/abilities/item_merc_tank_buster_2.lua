
item_merc_tank_buster_2 = class({})
LinkLuaModifier( "modifier_item_merc_fun", "modifiers/modifier_item_merc_fun", LUA_MODIFIER_MOTION_NONE )

function item_merc_tank_buster_2:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_tank_buster_2:GetIntrinsicModifierName()
	return "modifier_item_merc_fun"
end