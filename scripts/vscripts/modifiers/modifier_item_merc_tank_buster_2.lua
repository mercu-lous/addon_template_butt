modifier_item_merc_tank_buster_2 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_item_merc_tank_buster_2:IsHidden()
	-- actual true
	return false
end

function modifier_item_merc_tank_buster_2:IsPurgable()
	return false
end

function modifier_item_merc_tank_buster_2:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_tank_buster_2:OnCreated( kv )
	-- references
    self.attackspeed = self:GetAbility():GetSpecialValueFor("bonus_attackspeed")
    self.pure_damage= self:GetAbility():GetSpecialValueFor("bonus_pure_damage")
    self.max_health_damage = self:GetAbility():GetSpecialValueFor("max_health_percent_damage")
    self.min_health_percent = self:GetAbility():GetSpecialValueFor("min_health_percent")
end

function modifier_item_merc_tank_buster_2:OnRefresh( kv )
	-- references
	
    self.damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
    self.pure_damage= self:GetAbility():GetSpecialValueFor("bonus_pure_damage")
	self.max_health_damage = self:GetAbility():GetSpecialValueFor("maxhealth_percent_damage")
    self.min_health_percent = self:GetAbility():GetSpecialValueFor("min_health_percent")

end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_tank_buster_2:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
	return funcs
end

function modifier_item_merc_tank_buster_2:GetModifierProcAttack_BonusDamage_Pure( params )
	local target = params.target
	local percentHealth = target:GetHealthPercent()
	local maxHealth = target:GetBaseMaxHealth()
	local effectiveness = math.max((percentHealth - self.min_health_percent) / (100 - self.min_health_percent), 0)
	local dmg = (((maxHealth * self.max_health_damage * effectiveness) / 100) + self.pure_damage)

	return dmg
end

function modifier_item_merc_tank_buster_2:GetModifierAttackSpeedBonus_Constant()
	return self.attackspeed
end