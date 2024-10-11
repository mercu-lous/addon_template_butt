item_merc_attack_range_booster_modifier = class({})

function item_merc_attack_range_booster_modifier:IsHidden() return false end
function item_merc_attack_range_booster_modifier:IsPurgable() return false end
function item_merc_attack_range_booster_modifier:RemoveOnDeath() return false end

function item_merc_attack_range_booster_modifier:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function item_merc_attack_range_booster_modifier:IsStackable()
    return true
end


function item_merc_attack_range_booster_modifier:OnCreated()
    -- Initialize the values from the ability's special values
    self.bonus_range = self:GetAbility():GetSpecialValueFor("bonus_range")
    self.strength = self:GetAbility():GetSpecialValueFor("strength")
    self.agility = self:GetAbility():GetSpecialValueFor("agility")
end

function item_merc_attack_range_booster_modifier:OnRefresh()
    -- Initialize the values from the ability's special values
    self.bonus_range = self:GetAbility():GetSpecialValueFor("bonus_range")
    self.strength = self:GetAbility():GetSpecialValueFor("strength")
    self.mana_bonus = self:GetAbility():GetSpecialValueFor("agility")
end

function item_merc_attack_range_booster_modifier:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_ATTACK_RANGE_BONUS,
        }
    return funcs
end

function item_merc_attack_range_booster_modifier:GetModifierBonusStats_Strength()
    return self.strength
end

function item_merc_attack_range_booster_modifier:GetModifierBonusStats_Agility()
    return self.agility
end

function item_merc_attack_range_booster_modifier:GetModifierAttackRangeBonus()
    return self.bonus_range
end
