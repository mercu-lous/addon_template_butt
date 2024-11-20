item_merc_tank_buster_modifier = class({})

--------------------------------------------------------------------------------
-- Classifications
function item_merc_tank_buster_modifier:IsHidden()
	-- actual true
	return false
end

function item_merc_tank_buster_modifier:IsPurgable()
	return false
end

function item_merc_tank_buster_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function item_merc_tank_buster_modifier:OnCreated( kv )
	-- references
    self.attackspeed = self:GetAbility():GetSpecialValueFor("bonus_attackspeed")
    self.pure_damage= self:GetAbility():GetSpecialValueFor("bonus_pure_damage")
end

function item_merc_tank_buster_modifier:OnRefresh( kv )
	-- references

    self.damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
    self.pure_damage= self:GetAbility():GetSpecialValueFor("bonus_pure_damage")
end

--------------------------------------------------------------------------------
-- Modifier Effects
function item_merc_tank_buster_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
	return funcs
end

function item_merc_tank_buster_modifier:GetModifierProcAttack_BonusDamage_Pure( params )
	return self.pure_damage
end

function item_merc_tank_buster_modifier:GetModifierAttackSpeedBonus_Constant()
	return self.attackspeed
end