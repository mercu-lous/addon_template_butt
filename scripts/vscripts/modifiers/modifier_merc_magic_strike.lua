modifier_merc_magic_strike = class({})

function modifier_merc_magic_strike:IsHidden()
	return false
end

function modifier_merc_magic_strike:IsDebuff()
	return false
end

function modifier_merc_magic_strike:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_magic_strike:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )

	self.chance = self:GetAbility():GetSpecialValueFor( "strike_chance" )
	self.damage = self:GetAbility():GetSpecialValueFor( "strike_damage" )


	if not IsServer() then return end
end

function modifier_merc_magic_strike:OnRefresh( kv )
	self:OnCreated( kv )	
end

function modifier_merc_magic_strike:OnRemoved()
end

function modifier_merc_magic_strike:OnDestroy()
end

function modifier_merc_magic_strike:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_magic_strike:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_magic_strike:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_MAGICAL,
		MODIFIER_EVENT_ON_ATTACK,
	}

	return funcs
end

function modifier_merc_magic_strike:OnAttack(params)
	if not IsServer() then return end
	if params.attacker ~= self:GetParent() then return end   
 
	if RollPercentage(self.chance) then
	   self.proc = true
	end
 end
 
 function modifier_merc_magic_strike:CheckState()
	return {
	   [MODIFIER_STATE_CANNOT_MISS] = self.proc
	}
 end
 
 function modifier_merc_magic_strike:GetModifierProcAttack_BonusDamage_Magical(params)
	 local bonus_damage = 0
	 if self.proc then
		bonus_damage = self.damage
	 end

	 SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, params.target, self.damage, nil)
	 self.proc = false
	 return bonus_damage
 end

