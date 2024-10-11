
merc_bash = class({})
LinkLuaModifier( "modifier_merc_bash", "modifiers/modifier_merc_bash", LUA_MODIFIER_MOTION_NONE )
-- Init Abilities
function merc_bash:Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_spirit_breaker.vsndevts", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_spirit_breaker/spirit_breaker_greater_bash.vpcf", context )
end

function merc_bash:Spawn()
	if not IsServer() then return end
end

--------------------------------------------------------------------------------
-- Passive Modifier
function merc_bash:GetIntrinsicModifierName()
	return "modifier_merc_bash"
end