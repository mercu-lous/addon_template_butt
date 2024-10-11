item_cast_range_booster_modifier_merc = class({})

function item_cast_range_booster_modifier_merc:IsHidden() return false end
function item_cast_range_booster_modifier_merc:IsPurgable() return false end
function item_cast_range_booster_modifier_merc:RemoveOnDeath() return false end

function item_cast_range_booster_modifier_merc:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function item_cast_range_booster_modifier_merc:IsStackable()
    return true
end


function item_cast_range_booster_modifier_merc:OnCreated()
    -- Initialize the values from the ability's special values
    self.cast_range_bonus = self:GetAbility():GetSpecialValueFor("cast_range_bonus")
    self.mana_regen = self:GetAbility():GetSpecialValueFor("mana_regen")
    self.mana_bonus = self:GetAbility():GetSpecialValueFor("mana_bonus")
end

function item_cast_range_booster_modifier_merc:OnRefresh()
    -- Initialize the values from the ability's special values
    self.cast_range_bonus = self:GetAbility():GetSpecialValueFor("cast_range_bonus")
    self.mana_regen = self:GetAbility():GetSpecialValueFor("mana_regen")
    self.mana_bonus = self:GetAbility():GetSpecialValueFor("mana_bonus")
end

function item_cast_range_booster_modifier_merc:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_CAST_RANGE_BONUS_STACKING,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_MANA_BONUS,
    }
    return funcs
end

function item_cast_range_booster_modifier_merc:GetModifierCastRangeBonusStacking()
    return self.cast_range_bonus
end

function item_cast_range_booster_modifier_merc:GetModifierConstantManaRegen()
    return self.mana_regen
end

function item_cast_range_booster_modifier_merc:GetModifierManaBonus()
    return self.mana_bonus
end