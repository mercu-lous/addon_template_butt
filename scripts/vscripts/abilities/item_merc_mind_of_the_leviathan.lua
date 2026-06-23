
item_merc_mind_of_the_leviathan = class({})
LinkLuaModifier( "modifier_item_merc_mind_of_the_leviathan", "modifiers/modifier_item_merc_mind_of_the_leviathan", LUA_MODIFIER_MOTION_NONE )

function item_merc_mind_of_the_leviathan:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_mind_of_the_leviathan:GetIntrinsicModifierName()
	return "modifier_item_merc_mind_of_the_leviathan"
end