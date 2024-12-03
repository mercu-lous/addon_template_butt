merc_work_horse = class({})
LinkLuaModifier( "modifier_merc_work_horse", "modifiers/modifier_merc_work_horse", LUA_MODIFIER_MOTION_NONE )

function merc_work_horse:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- cancel if linken
	-- if target:TriggerSpellAbsorb( self ) then return end

	-- load data
	local duration = self:GetSpecialValueFor("duration")


	-- add modifier
	self.modifier = target:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_merc_work_horse", -- modifier name
		{ duration = duration } -- kv
	)

end

-- function merc_work_horse:OnSpellAppliedSuccessfully(event)
-- 	-- unit identifier
-- 	local caster = self:GetCaster()
-- 	local target = self:GetCursorTarget()

-- 	-- cancel if linken
-- 	if target:TriggerSpellAbsorb( self ) then return end

-- 	-- load data
-- 	local duration1 = self:GetSpecialValueFor("duration")


-- 	-- add modifier
-- 	self.modifier = target:AddNewModifier(
-- 		caster, -- player source
-- 		self, -- ability source
-- 		"modifier_merc_work_horse", -- modifier name
-- 		{ duration = duration1 } -- kv
-- 	)
	
-- end
