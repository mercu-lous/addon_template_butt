
item_merc_protecting_plate = class({})
LinkLuaModifier( "modifier_merc_protecting_plate", "modifiers/modifier_merc_protecting_plate", LUA_MODIFIER_MOTION_NONE )

function item_merc_protecting_plate:OnSpellStart()
	print("SPELL START")
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_merc_protecting_plate", {
		duration = self:GetSpecialValueFor("duration"),
	})
	
end

