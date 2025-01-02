modifier_item_merc_octarine_core_x = class({})

function modifier_item_merc_octarine_core_x:IsHidden() return false end
function modifier_item_merc_octarine_core_x:IsPurgable() return false end
function modifier_item_merc_octarine_core_x:RemoveOnDeath() return false end

function modifier_item_merc_octarine_core_x:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_octarine_core_x:IsStackable()
    return true
end


function modifier_item_merc_octarine_core_x:OnCreated()
    -- Initialize the values from the ability's special values
    self.cooldown_reduction = self:GetAbility():GetSpecialValueFor("cooldown_reduction")
    self.mana_regen = self:GetAbility():GetSpecialValueFor("mana_regen")
    self.health_bonus = self:GetAbility():GetSpecialValueFor("health_bonus")
    self.mana_bonus = self:GetAbility():GetSpecialValueFor("mana_bonus")
end

function modifier_item_merc_octarine_core_x:OnRefresh()
    -- Initialize the values from the ability's special values
    self.cooldown_reduction = self:GetAbility():GetSpecialValueFor("cooldown_reduction")
    self.mana_regen = self:GetAbility():GetSpecialValueFor("mana_regen")
    self.health_bonus = self:GetAbility():GetSpecialValueFor("health_bonus")
    self.mana_bonus = self:GetAbility():GetSpecialValueFor("mana_bonus")
end

function modifier_item_merc_octarine_core_x:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_COOLDOWN_PERCENTAGE,
        MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_MANA_BONUS,
    }
    return funcs
end

function modifier_item_merc_octarine_core_x:GetModifierPercentageCooldown()
    return self.cooldown_reduction
end

function modifier_item_merc_octarine_core_x:GetModifierHealthBonus()
    return self.health_bonus
end


function modifier_item_merc_octarine_core_x:GetModifierConstantManaRegen()
    return self.mana_regen
end

function modifier_item_merc_octarine_core_x:GetModifierManaBonus()
    return self.mana_bonus
end