merc_work_horse = class({})
LinkLuaModifier( "item_merc_divine_scepter_modifier", "modifiers/item_merc_divine_scepter_modifier", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_item_merc_e_blade", "modifiers/modifier_item_merc_e_blade", LUA_MODIFIER_MOTION_NONE )

function merc_work_horse:GetIntrinsicModifierName()
  return "item_merc_divine_scepter_modifier"
end

function merc_work_horse:OnSpellStart()
	print("SPELL START")	
end

function merc_work_horse:OnSpellAppliedSuccessfully(event)
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- cancel if linken
	if target:TriggerSpellAbsorb( self ) then return end

	-- load data
	local duration1 = self:GetSpecialValueFor("duration")


	-- add modifier
	self.modifier = target:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_item_merc_e_blade", -- modifier name
		{ duration = duration1 } -- kv
	)

	target:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_item_merc_e_blade", -- modifier name
		{ duration = duration1 } -- kv
	)
	
end
