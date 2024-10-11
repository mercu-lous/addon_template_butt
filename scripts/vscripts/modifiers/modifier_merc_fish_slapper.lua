modifier_merc_fish_slapper = class({})

function modifier_merc_fish_slapper:IsHidden()
	return false
end

function modifier_merc_fish_slapper:IsDebuff()
	return false
end

function modifier_merc_fish_slapper:IsPurgable()
	return false
end

function modifier_merc_fish_slapper:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_fish_slapper:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_fish_slapper:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )

	self.chance = self:GetAbility():GetSpecialValueFor( "strike_chance" )
	self.damage = self:GetAbility():GetSpecialValueFor( "strike_damage" )
	self.duration = self:GetAbility():GetSpecialValueFor( "bash_duration" )
	self.strength = self:GetAbility():GetSpecialValueFor( "strength" )
	self:StartIntervalThink(0.1)



	if not IsServer() then return end
end

function modifier_merc_fish_slapper:OnRefresh( kv )
	self:OnCreated( kv )	
end

function modifier_merc_fish_slapper:OnRemoved()
end

function modifier_merc_fish_slapper:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_fish_slapper:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	}
	return funcs
end

 
 function modifier_merc_fish_slapper:CheckState()
	return {
	   [MODIFIER_STATE_CANNOT_MISS] = self.proc
	}
 end

 function modifier_merc_fish_slapper:GetModifierBonusStats_Strength(params) 
	return self.strength
 end
 
 
 function modifier_merc_fish_slapper:GetModifierProcAttack_BonusDamage_Physical(params)
	 local bonus_damage = 0
	 if self.proc then
		bonus_damage = self.damage
	 
	 self:magic_strike( params.target, false )
	 SendOverheadEventMessage(nil, OVERHEAD_ALERT_DAMAGE, params.target, self.damage, nil)
	 end 
	return bonus_damage
 end

--------------------------------------------------------------------------------
-- Helper
function modifier_merc_fish_slapper:magic_strike( target, double )

	local damage = self.damage
	target:AddNewModifier(
		self.parent, -- player source
		self.ability, -- ability source
		"modifier_stunned", -- modifier name
		{ duration = self.duration } -- kv
	)

end


function modifier_merc_fish_slapper:OnIntervalThink()
	if IsServer() then
		if self.proc then
			self.proc = false
			self:CheckState()
		end
		if RollPercentage(self.chance) then
			self.proc = true
			self:CheckState()
		 end
	end
end