
item_merc_fish_slapper = class({})
LinkLuaModifier( "modifier_merc_fish_slapper", "modifiers/modifier_merc_fish_slapper", LUA_MODIFIER_MOTION_NONE )

function item_merc_fish_slapper:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_fish_slapper:GetIntrinsicModifierName()
	return "modifier_merc_fish_slapper"
end