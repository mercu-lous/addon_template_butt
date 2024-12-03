item_merc_divine_scepter_modifier = class({})

--------------------------------------------------------------------------------
-- Classifications
function item_merc_divine_scepter_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function item_merc_divine_scepter_modifier:IsHidden()
	-- actual true
	return false
end

function item_merc_divine_scepter_modifier:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function item_merc_divine_scepter_modifier:OnCreated( kv )
	-- references
    self.damage = self:GetAbility():GetSpecialValueFor("damage")

end

function item_merc_divine_scepter_modifier:OnRefresh( kv )
	-- references
    self.damage = self:GetAbility():GetSpecialValueFor("damage")

end

function item_merc_divine_scepter_modifier:OnDestroy( kv )

end

--------------------------------------------------------------------------------
-- Modifier Effects
function item_merc_divine_scepter_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
	}

	return funcs
end	



function item_merc_divine_scepter_modifier:GetModifierSpellAmplify_Percentage()
	return self.damage
end
