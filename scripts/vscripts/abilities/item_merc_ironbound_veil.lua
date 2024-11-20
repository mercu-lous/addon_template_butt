
item_merc_ironbound_veil = class({})
LinkLuaModifier( "modifier_item_merc_ironbound_veil", "modifiers/modifier_item_merc_ironbound_veil", LUA_MODIFIER_MOTION_NONE )

function item_merc_ironbound_veil:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_ironbound_veil:GetIntrinsicModifierName()
	return "modifier_item_merc_ironbound_veil"
end