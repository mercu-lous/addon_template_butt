modifier_merc_bash = class({})

function modifier_merc_bash:IsHidden()
	return false
end

function modifier_merc_bash:IsDebuff()
	return false
end

function modifier_merc_bash:IsPurgable()
	return false
end

function modifier_merc_bash:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_bash:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_bash:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )

	self.chance = self:GetAbility():GetSpecialValueFor( "bash_chance" )
	self.damage = self:GetAbility():GetSpecialValueFor( "bash_damage" )
	self.duration = self:GetAbility():GetSpecialValueFor( "bash_duration" )

	if not IsServer() then return end
end

function modifier_merc_bash:OnRefresh( kv )
	self:OnCreated( kv )	
end

function modifier_merc_bash:OnRemoved()
end

function modifier_merc_bash:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_bash:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}

	return funcs
end

function modifier_merc_bash:GetModifierProcAttack_Feedback( params )
	if not IsServer() then return end
	-- unit filter
	-- local filter = UnitFilter(
	-- 	params.target,
	-- 	DOTA_UNIT_TARGET_TEAM_ENEMY,
	-- 	DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	-- 	DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,
	-- 	self.parent:GetTeamNumber()
	-- )
	-- if filter~=UF_SUCCESS then return end

	-- roll pseudo random
	if not RollPseudoRandomPercentage( self.chance, self.pseudoseed, self.parent ) then return end

	-- set cooldown
	self.ability:UseResources( false, false, false, true )

	-- proc
	self:Bash( params.target, false )
end

--------------------------------------------------------------------------------
-- Helper
function modifier_merc_bash:Bash( target, double )

	-- stun
	target:AddNewModifier(
		self.parent, -- player source
		self.ability, -- ability source
		"modifier_stunned", -- modifier name
		{ duration = self.duration } -- kv
	)

	local damage = self.damage

	-- apply damage
	local damageTable = {
		victim = target,
		attacker = self.parent,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self.ability, --Optional.
	}
	ApplyDamage(damageTable)


	-- play effects
	self:PlayEffects( target, target:IsCreep() )
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_merc_bash:PlayEffects( target, isCreep )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_spirit_breaker/spirit_breaker_greater_bash.vpcf"
	local sound_cast = "Hero_Spirit_Breaker.GreaterBash"
	if isCreep then
		sound_cast = "Hero_Spirit_Breaker.GreaterBash.Creep"
	end

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_POINT_FOLLOW, target )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		target,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, target )
end