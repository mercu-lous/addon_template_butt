modifier_merc_magic_resistance_lua = class({})
--------------------------------------------------------------------------------

function modifier_merc_magic_resistance_lua:IsHidden()
	return false
end


function modifier_merc_magic_resistance_lua:DestroyOnExpire()
	return false
end

function modifier_merc_magic_resistance_lua:DeclareFunctions()
	local funcs = 
	{
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
	}
	return funcs
end

function modifier_merc_magic_resistance_lua:OnCreated( kv )
	self.magic_resistance = self:GetAbility():GetSpecialValueFor( "magic_resistance" )
end

function modifier_merc_magic_resistance_lua:GetModifierMagicalResistanceBonus()
	return self.magic_resistance
end

-- function modifier_merc_magic_resistance_lua:GetModifierMagicalResistanceDirectModification()
-- 	return 90
-- end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------