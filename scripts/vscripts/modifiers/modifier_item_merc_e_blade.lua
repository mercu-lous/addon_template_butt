modifier_item_merc_e_blade = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_item_merc_e_blade:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_e_blade:IsHidden()
	return false
end

function modifier_item_merc_e_blade:IsDebuff()
	return true
end

function modifier_item_merc_e_blade:IsStunDebuff()
	return false
end

function modifier_item_merc_e_blade:IsPurgable()
	return true
end

function modifier_item_merc_e_blade:CanParentBeAutoAttacked()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_item_merc_e_blade:OnCreated( kv )
	-- references
	self.blast_movement_slow = self:GetAbility():GetSpecialValueFor("blast_movement_slow")
	self.ethereal_damage_bonus = self:GetAbility():GetSpecialValueFor("ethereal_damage_bonus")

end

function modifier_item_merc_e_blade:OnRefresh( kv )
	
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_e_blade:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_INCOMING_SPELL_DAMAGE_CONSTANT
	}

	return funcs
end

function modifier_item_merc_e_blade:GetModifierMoveSpeedBonus_Percentage()
	return blast_movement_slow
end

function modifier_item_merc_e_blade:GetModifierIncomingSpellDamageConstant()
	return ethereal_damage_bonus
end


--------------------------------------------------------------------------------
-- Status Effects
function modifier_item_merc_e_blade:CheckState()
	local state = {
		[MODIFIER_STATE_DISARMED] = true,
	}

	return state
end


--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_item_merc_e_blade:GetEffectName()
	return "particles/items_fx/ethereal_blade.vpcf"
end

function modifier_item_merc_e_blade:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end