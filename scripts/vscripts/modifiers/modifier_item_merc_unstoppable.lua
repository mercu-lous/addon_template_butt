modifier_item_merc_unstoppable = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_item_merc_unstoppable:IsHidden()
	-- actual true
	return false
end

function modifier_item_merc_unstoppable:IsPurgable()
	return false
end

function modifier_item_merc_unstoppable:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_unstoppable:OnCreated( kv )

    self.starting_health = self:GetAbility():GetSpecialValueFor("starting_health")
    self.stacking_health= self:GetAbility():GetSpecialValueFor("stacking_health")
	self.stacking_size_percent = self:GetAbility():GetSpecialValueFor("stacking_size_percent")
	self.currentHealth = self.starting_health
	self.currentSize = 1
end

function modifier_item_merc_unstoppable:OnRefresh( kv )
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_unstoppable:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_HERO_KILLED,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_MODEL_SCALE,

	}
	return funcs
end

function modifier_item_merc_unstoppable:OnHeroKilled( params )
	if not IsServer() then return end
	if params.attacker == self:GetParent() then
		print("Hero Slane")
		self.currentHealth = self.currentHealth + self.stacking_health
		self.currentSize = self.currentSize + self.stacking_size_percent
		self:GetParent():CalculateStatBonus( true )
		print("Hero Slane 2")
	end
end

function modifier_item_merc_unstoppable:GetModifierModelScale( params )
	return self.currentSize
end

function modifier_item_merc_unstoppable:GetModifierHealthBonus()
	return self.currentHealth
end