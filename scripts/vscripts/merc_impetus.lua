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
	local distance_min = self:GetSpecialValueFor("distance_min")
	local distance_dmg = self:GetSpecialValueFor("bonus_damage")
	
	-- calculate distance & damage
	local distance = (caster:GetOrigin()-target:GetOrigin()):Length2D()
	local distance_damage = distance_dmg + 25 - (distance / 4)
	if (distance < distance_min) then 
		distance_damage = distance_dmg
	end


	-- apply damage
	local damageTable = {
		victim = target,
		attacker = caster,
		damage = distance_damage,
		damage_type = DAMAGE_TYPE_PURE,
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)

	-- play effects
	local sound_cast = "Hero_Enchantress.ImpetusDamage"
	EmitSoundOn( sound_cast, target )
end