
item_merc_blade_mail = class({})
LinkLuaModifier( "modifier_merc_damage_return", "modifiers/modifier_merc_damage_return", LUA_MODIFIER_MOTION_NONE )

function item_merc_blade_mail:OnSpellStart()
	print("SPELL START")
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_merc_damage_return", {
		duration = 5,
	})
	
end

