item_merc_high_roller_modifier = class({})

--------------------------------------------------------------------------------
-- Classifications
function item_merc_high_roller_modifier:IsHidden()
	-- actual true
	return false
end

function item_merc_high_roller_modifier:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function item_merc_high_roller_modifier:OnCreated( kv )
	-- references
	self.crit_chance = 3
	self.crit_bonus = 3000
end

function item_merc_high_roller_modifier:OnRefresh( kv )
	-- references
	self.crit_chance = 3
	self.crit_bonus = 3000
end

function item_merc_high_roller_modifier:OnDestroy( kv )

end

--------------------------------------------------------------------------------
-- Modifier Effects
function item_merc_high_roller_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}

	return funcs
end

function item_merc_high_roller_modifier:GetModifierPreAttack_CriticalStrike( params )
	if IsServer() then
		if self:RollChance( self.crit_chance ) then 
			self.record = params.record
			return self.crit_bonus
		end
	end
end

function item_merc_high_roller_modifier:GetModifierPreAttack_BonusDamage()
	return 77
end

function item_merc_high_roller_modifier:GetModifierProcAttack_Feedback( params )
	if IsServer() then
		if self.record then
			self.record = nil
			self:PlayEffects( params.target )
		end
	end
end
--------------------------------------------------------------------------------
-- Helper
function item_merc_high_roller_modifier:RollChance( chance )
	local rand = math.random()
	if rand<chance/100 then
		return true
	end
	return false
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function item_merc_high_roller_modifier:PlayEffects( target )
	-- Load effects
	local particle_cast = "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf"
	local sound_cast = "Hero_PhantomAssassin.CoupDeGrace"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		target,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		target:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlForward( effect_cast, 1, (self:GetParent():GetOrigin()-target:GetOrigin()):Normalized() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	EmitSoundOn( sound_cast, target )
end