modifier_item_merc_respawn_reducer = class({})

function modifier_item_merc_respawn_reducer:IsHidden()
	return false
end

function modifier_item_merc_respawn_reducer:IsDebuff()
	return false
end

function modifier_item_merc_respawn_reducer:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_item_merc_respawn_reducer:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.respawn_reduction = self.ability:GetSpecialValueFor("respawn_reduction")

	if not IsServer() then return end
end

function modifier_item_merc_respawn_reducer:OnRefresh( kv )
end

function modifier_item_merc_respawn_reducer:OnRemoved()
end

function modifier_item_merc_respawn_reducer:OnDestroy()
end
--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_respawn_reducer:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_RESPAWNTIME,
	}

	return funcs
end

function modifier_item_merc_respawn_reducer:GetModifierConstantRespawnTime()
	return -90
 end

