
item_merc_basher_highroller = class({})
LinkLuaModifier( "modifier_merc_bash", "modifiers/modifier_merc_bash", LUA_MODIFIER_MOTION_NONE )
-- Init Abilities
function item_merc_basher_highroller:Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_spirit_breaker.vsndevts", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_spirit_breaker/spirit_breaker_greater_bash.vpcf", context )
end

function item_merc_basher_highroller:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function item_merc_basher_highroller:GetIntrinsicModifierName()
	return "modifier_merc_bash"
end