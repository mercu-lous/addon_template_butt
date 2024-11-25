item_merc_divine_scepter = class({})
LinkLuaModifier("item_merc_divine_scepter_modifier", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_item_merc_e_blade", LUA_MODIFIER_MOTION_NONE)

function item_merc_divine_scepter:GetIntrinsicModifierName()
  return "item_merc_divine_scepter_modifier"
end

function item_merc_divine_scepter:OnSpellStart()
	print("SPELL START")	
end

function item_merc_divine_scepter:OnSpellAppliedSuccessfully(event)
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- cancel if linken
	if target:TriggerSpellAbsorb( self ) then return end

	-- load data
	local duration = self:GetSpecialValueFor("duration")


	-- add modifier
	self.modifier = target:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_item_merc_e_blade", -- modifier name
		{ duration = duration } -- kv
	)
	
end
