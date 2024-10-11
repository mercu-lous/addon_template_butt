modifier_merc_flying = class({})
--------------------------------------------------------------------------------

function modifier_merc_flying:IsHidden()
	return false
end

function modifier_merc_flying:OnCreated( kv )
	self.move_speed_bonus = self:GetAbility():GetSpecialValueFor( "move_speed_bonus" )
	self.bonus_night_vision = self:GetAbility():GetSpecialValueFor( "bonus_night_vision" )
end

function modifier_merc_flying:CheckState()
	local state = {
	[MODIFIER_STATE_FLYING] = true,
	[MODIFIER_STATE_FORCED_FLYING_VISION] = true,
	}

	return state
end

function modifier_merc_flying:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        -- MODIFIER_PROPERTY_BONUS_VISION_PERCENTAGE,
		MODIFIER_PROPERTY_BONUS_NIGHT_VISION,
    }
	return funcs
end

function modifier_merc_flying:GetModifierMoveSpeedBonus_Constant()
    return self.move_speed_bonus  -- Adjust the movement speed bonus here
end

-- function modifier_merc_flying:GetBonusVisionPercentage()
--     return 10  -- Adjust the bonus vision percentage here
-- end

function modifier_merc_flying:GetBonusNightVision() 
	return self.bonus_night_vision
end