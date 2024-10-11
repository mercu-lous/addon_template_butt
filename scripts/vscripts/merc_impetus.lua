merc_impetus = class({})
LinkLuaModifier( "modifier_generic_orb_effect_lua", "generic/modifier_generic_orb_effect_lua", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function merc_impetus:GetIntrinsicModifierName()
	return "modifier_generic_orb_effect_lua"
end

--------------------------------------------------------------------------------
-- Ability Start
function merc_impetus:OnSpellStart()
end

function merc_impetus:GetProjectileName()
	return "particles/units/heroes/hero_enchantress/enchantress_impetus.vpcf"
end

--------------------------------------------------------------------------------
-- Orb Effects
function merc_impetus:OnOrbFire( params )
	-- play effects
	local sound_cast = "Hero_Enchantress.Impetus"
	EmitSoundOn( sound_cast, self:GetCaster() )
end

function merc_impetus:OnOrbImpact( params )
	-- unit identifier
	local caster = self:GetCaster()
	local target = params.target

	-- load data
	local distance_cap = self:GetSpecialValueFor("distance_cap")
	local distance_dmg = self:GetSpecialValueFor("bonus_damage")
	
	-- calculate distance & damage
	local distance = math.min( (caster:GetOrigin()-target:GetOrigin()):Length2D(), distance_cap )
	local damage = distance_dmg - (distance / 5)

	-- apply damage
	local damageTable = {
		victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_PURE,
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)

	-- play effects
	local sound_cast = "Hero_Enchantress.ImpetusDamage"
	EmitSoundOn( sound_cast, target )
end