
merc_pure_attack_damage = class({})
LinkLuaModifier( "modifier_merc_pure_attack_damage", "modifiers/modifier_merc_pure_attack_damage", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function merc_pure_attack_damage:GetIntrinsicModifierName()
	return "modifier_merc_pure_attack_damage"
end