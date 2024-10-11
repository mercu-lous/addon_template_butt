modifier_merc_fish_slapper_old_trash = class({})

function modifier_merc_fish_slapper_old_trash:IsHidden()
	return false
end

function modifier_merc_fish_slapper_old_trash:IsDebuff()
	return false
end

function modifier_merc_fish_slapper_old_trash:IsPurgable()
	return false
end

function modifier_merc_fish_slapper_old_trash:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_fish_slapper_old_trash:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_fish_slapper_old_trash:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )

	self.chance = self:GetAbility():GetSpecialValueFor( "strike_chance" )
	self.damage = self:GetAbility():GetSpecialValueFor( "strike_damage" )
	self.duration = self:GetAbility():GetSpecialValueFor( "bash_duration" )
	self.strength = self:GetAbility():GetSpecialValueFor( "strength" )



	if not IsServer() then return end
end

function modifier_merc_fish_slapper_old_trash:OnRefresh( kv )
	self:OnCreated( kv )	
end

function modifier_merc_fish_slapper_old_trash:OnRemoved()
end

function modifier_merc_fish_slapper_old_trash:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_fish_slapper_old_trash:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL,
		MODIFIER_EVENT_ON_ATTACK_RECORD ,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	}

	return funcs
end

function modifier_merc_fish_slapper_old_trash:OnAttackRecord(params)
	if not IsServer() then return end
	if params.attacker ~= self:GetParent() then return end   
 
	if RollPercentage(self.chance) then
	   self.proc = true
	end
	self:CheckState()
 end
 
 function modifier_merc_fish_slapper_old_trash:CheckState()
	return {
	   [MODIFIER_STATE_CANNOT_MISS] = self.proc
	}
 end

 function modifier_merc_fish_slapper_old_trash:GetModifierBonusStats_Strength(params) 
	return self.strength
 end
 

 
 function modifier_merc_fish_slapper_old_trash:GetModifierProcAttack_BonusDamage_Magical(params)
	 local bonus_damage = 0
	 if self.proc then
		bonus_damage = self.damage
	 end
	 self:magic_strike( params.target, false )
	 SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, params.target, self.damage, nil)
	 self.proc = false
	 return bonus_damage
 end

--------------------------------------------------------------------------------
-- Helper
function modifier_merc_fish_slapper_old_trash:magic_strike( target, double )

	local damage = self.damage
	target:AddNewModifier(
		self.parent, -- player source
		self.ability, -- ability source
		"modifier_stunned", -- modifier name
		{ duration = self.duration } -- kv
	)

end
