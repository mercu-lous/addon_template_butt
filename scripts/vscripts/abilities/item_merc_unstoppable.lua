
item_merc_unstoppable = class({})
LinkLuaModifier( "modifier_item_merc_unstoppable", "modifiers/modifier_item_merc_unstoppable", LUA_MODIFIER_MOTION_NONE )

function item_merc_unstoppable:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_unstoppable:GetIntrinsicModifierName()
	return "modifier_item_merc_unstoppable"
end