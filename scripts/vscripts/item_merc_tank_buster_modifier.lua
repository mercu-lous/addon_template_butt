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
	return 40
end

function item_merc_tank_buster_modifier:GetModifierAttackSpeedBonus_Constant()
	return 40
end