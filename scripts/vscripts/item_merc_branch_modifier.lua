item_merc_branch_modifier = class({})

function item_merc_branch_modifier:IsHidden() return false end
function item_merc_branch_modifier:IsPurgable() return false end
function item_merc_branch_modifier:RemoveOnDeath() return false end

function item_merc_branch_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function item_merc_branch_modifier:IsStackable()
    return true
end

function item_merc_branch_modifier:OnCreated()
    -- Initialize the values from the ability's special values
    self.all_stats = self:GetAbility():GetSpecialValueFor("all_stats")
end

function item_merc_branch_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
    }
    return funcs
end

function item_merc_branch_modifier:GetModifierBonusStats_Strength()
    return self.all_stats
end

function item_merc_branch_modifier:GetModifierBonusStats_Agility()
    return self.all_stats
end

function item_merc_branch_modifier:GetModifierBonusStats_Intellect()
    return self.all_stats
end