modifier_merc_protecting_plate = class({})

function modifier_merc_protecting_plate:IsHidden()
	return false
end

function modifier_merc_protecting_plate:IsDebuff()
	return false
end

function modifier_merc_protecting_plate:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_protecting_plate:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()
	self.pseudoseed = RandomInt( 1, 100 )
	self.numProcs = 0 --// max 3

	if not IsServer() then return end
end

function modifier_merc_protecting_plate:OnRefresh( kv )
end

function modifier_merc_protecting_plate:OnRemoved()
end

function modifier_merc_protecting_plate:OnDestroy()
end

function modifier_merc_protecting_plate:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_merc_protecting_plate:IsStackable()
    return true
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_protecting_plate:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MIN_HEALTH,
	}

	return funcs
end

function modifier_merc_protecting_plate:GetMinHealth(params)
	return 100
 end

