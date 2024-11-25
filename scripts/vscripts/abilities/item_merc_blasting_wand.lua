item_merc_blasting_wand = class({})
LinkLuaModifier( "modifier_item_merc_blasting_wand_thinker", "modifiers/modifier_item_merc_blasting_wand_thinker", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Custom KV
-- AOE Radius
function item_merc_blasting_wand:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

--------------------------------------------------------------------------------
-- Ability Start
function item_merc_blasting_wand:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()

	-- load data

	-- create thinker
	CreateModifierThinker(
		caster,
		self,
		"modifier_item_merc_blasting_wand_thinker",
		{},
		point,
		caster:GetTeamNumber(),
		false
	)

	-- effects
	local sound_cast = "Hero_Bloodseeker.BloodRite.Cast"
	EmitSoundOn( sound_cast, caster )
end