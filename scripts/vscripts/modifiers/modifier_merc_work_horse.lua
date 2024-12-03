modifier_merc_work_horse = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_merc_work_horse:IsHidden()
	return false
end

function modifier_merc_work_horse:IsDebuff()
	return false
end

function modifier_merc_work_horse:IsStunDebuff()
	return false
end

function modifier_merc_work_horse:IsPurgable()
	return false
end

function modifier_merc_work_horse:CanParentBeAutoAttacked()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_work_horse:OnCreated( kv )
    self.unit = self:GetAbility():GetCaster()
	self:StartIntervalThink(0.03)
end

function modifier_merc_work_horse:OnRefresh( kv )
	
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_merc_work_horse:DeclareFunctions()
	local funcs = {
		
	}

	return funcs
end


--------------------------------------------------------------------------------
-- Status Effects
function modifier_merc_work_horse:CheckState()
	local state = {
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
	}

	return state
end


function modifier_merc_work_horse:OnIntervalThink()
	if IsServer() then
		local caster = self:GetParent()
	    local point = self.unit:GetAbsOrigin()
	    local origin = caster:GetOrigin()
        
	    -- load data
	    local max_range = 1000

	    -- determine target position
	    local direction = (point - origin)
	    if direction:Length2D() > max_range then
		    direction = direction:Normalized() * max_range
	    end

	    -- teleport
	    FindClearSpaceForUnit( caster, origin + direction, true )

	end
end
