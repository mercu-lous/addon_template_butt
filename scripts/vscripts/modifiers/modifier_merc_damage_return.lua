modifier_merc_damage_return = class({})

function modifier_merc_damage_return:IsHidden()
	return false
end

function modifier_merc_damage_return:IsDebuff()
	return false
end

function modifier_merc_damage_return:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_damage_return:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )
	self.numProcs = 0 --// max 3

	if not IsServer() then return end
end

function modifier_merc_damage_return:OnRefresh( kv )
	self:OnCreated( kv )
end

function modifier_merc_damage_return:OnRemoved()
end

function modifier_merc_damage_return:OnDestroy()
end

function modifier_merc_damage_return:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_damage_return:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_damage_return:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	}

	return funcs
end

function modifier_merc_damage_return:OnTakeDamage(params)
	if not IsServer() then return end
	if params.attacker == self:GetParent() then return end

	if params.attacker:IsDebuffImmune() then return end

	if params.unit == self:GetParent() then
	if self.numProcs < 2 then
		self.numProcs = self.numProcs + 1
	
	local damageTable = {
		victim = params.attacker,
		attacker = self.parent,
		damage =(params.original_damage * 2),
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self.ability, --Optional.
	}
	ApplyDamage(damageTable)
	damageTable = {
		victim = params.attacker,
		attacker = self.parent,
		damage = (params.original_damage * 2),
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self.ability, --Optional.
	}
	ApplyDamage(damageTable)
	damageTable = {
		victim = params.attacker,
		attacker = self.parent,
		damage = (params.original_damage * 3),
		damage_type = DAMAGE_TYPE_PURE,
		ability = self.ability, --Optional.
	}
	ApplyDamage(damageTable)
		end
	end

 end
 
 function modifier_merc_damage_return:CheckState()
	return {
	   [MODIFIER_STATE_CANNOT_MISS] = self.proc
	}
 end
 
 function modifier_merc_damage_return:GetModifierProcAttack_BonusDamage_Magical(params)
	 local bonus_damage = 0
	 if self.proc then
		bonus_damage = self.damage
	 end

	 SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, params.target, self.damage, nil)
	 self.proc = false
	 return bonus_damage
 end

