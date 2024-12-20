modifier_merc_ogre_magi_multicast = class({})

modifier_merc_ogre_magi_multicast.singles = {
	["ogre_magi_fireblast_lua"] = true,
	["ogre_magi_unrefined_fireblast_lua"] = true,
	["ogre_magi_fireblast"] = true,
	["ogre_magi_ignite"] = true,
	["ogre_magi_unrefined_fireblast"] = true,
}

--------------------------------------------------------------------------------
-- Classifications
function modifier_merc_ogre_magi_multicast:IsHidden()
	return false
end

function modifier_merc_ogre_magi_multicast:IsDebuff()
	return false
end

function modifier_merc_ogre_magi_multicast:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_ogre_magi_multicast:OnCreated( kv )
	-- references
	self.chance_2 = self:GetAbility():GetSpecialValueFor( "multicast_2_times" ) * 100
	self.chance_3 = self:GetAbility():GetSpecialValueFor( "multicast_3_times" ) * 100
	self.chance_4 = self:GetAbility():GetSpecialValueFor( "multicast_4_times" ) * 100

    self.chance = self:GetAbility():GetSpecialValueFor( "multicast_chance" ) * 100

	self.buffer_range = 300
end

function modifier_merc_ogre_magi_multicast:OnRefresh( kv )
	-- references
	self.chance_2 = self:GetAbility():GetSpecialValueFor( "multicast_2_times" ) * 100
	self.chance_3 = self:GetAbility():GetSpecialValueFor( "multicast_3_times" ) * 100
	self.chance_4 = self:GetAbility():GetSpecialValueFor( "multicast_4_times" ) * 100

    self.chance = self:GetAbility():GetSpecialValueFor( "multicast_chance" ) * 100

end

function modifier_merc_ogre_magi_multicast:OnRemoved()
end

function modifier_merc_ogre_magi_multicast:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_ogre_magi_multicast:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
	}

	return funcs
end

function modifier_merc_ogre_magi_multicast:OnAbilityFullyCast( params )
	if params.unit~=self:GetCaster() then return end
	if params.ability==self:GetAbility() then return end

	-- only spells that have target
	if not params.target then return end

	-- if the spell can do both target and point, it should not trigger
	-- if bit.band( params.ability:GetBehaviorInt(), DOTA_ABILITY_BEHAVIOR_POINT ) ~= 0 then return end
	-- if bit.band( params.ability:GetBehaviorInt(), DOTA_ABILITY_BEHAVIOR_OPTIONAL_UNIT_TARGET ) ~= 0 then return end

	-- roll multicasts
	local casts = 1
	if RandomInt( 0,100 ) < self.chance_2 then casts = 2 end
	if RandomInt( 0,100 ) < self.chance_3 then casts = 3 end
	if RandomInt( 0,100 ) < self.chance_4 then casts = 4 end

    casts = self:GetMultiCast(0)

	-- check delay
	local delay = params.ability:GetSpecialValueFor( "multicast_delay" ) or 0

	-- only for fireblast multicast to single target
	local single = self.singles[params.ability:GetAbilityName()] or false

	-- multicast
	self:GetCaster():AddNewModifier(
		self:GetCaster(), -- player source
		self:GetAbility(), -- ability source
		"modifier_merc_ogre_magi_multicast_proc", -- modifier name
		{
			ability = params.ability:entindex(),
			target = params.target:entindex(),
			multicast = casts,
			delay = delay,
			single = single,
		} -- kv
	)
end

function modifier_merc_ogre_magi_multicast:GetMultiCast(currentCasts) 
    if RandomInt( 0,100 ) < self.chance then 
        return self:GetMultiCast(currentCasts + 1)
    end
    
    return currentCasts

end


