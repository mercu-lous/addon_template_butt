modifier_item_merc_ironbound_veil = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_item_merc_ironbound_veil:IsHidden()
	-- actual true
	return false
end

function modifier_item_merc_ironbound_veil:IsPurgable()
	return false
end

function modifier_item_merc_ironbound_veil:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_ironbound_veil:OnCreated( kv )

    self.magic_resist = self:GetAbility():GetSpecialValueFor("magic_resist")
    self.armor= self:GetAbility():GetSpecialValueFor("armor")

end

function modifier_item_merc_ironbound_veil:OnRefresh( kv )
	self.magic_resist = self:GetAbility():GetSpecialValueFor("magic_resist")
    self.armor= self:GetAbility():GetSpecialValueFor("armor")
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_ironbound_veil:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,

	}
	return funcs
end

function modifier_item_merc_ironbound_veil:GetModifierPhysicalArmorBonus()
	return self.armor
end

function modifier_item_merc_ironbound_veil:GetModifierMagicalResistanceBonus()
	return self.magic_resist
end