modifier_merc_status_resistance = class({})

function modifier_merc_status_resistance:IsHidden() return false end
function modifier_merc_status_resistance:IsPurgable() return false end
function modifier_merc_status_resistance:RemoveOnDeath() return false end

function modifier_merc_status_resistance:OnCreated(kv)
        self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
end

function modifier_merc_status_resistance:OnRefresh(kv)
        self.status_resistance = self:GetAbility():GetSpecialValueFor("status_resistance")
end

function modifier_merc_status_resistance:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_STATUS_RESISTANCE_STACKING,
    }
    return funcs
end


function modifier_merc_status_resistance:GetModifierStatusResistanceStacking()
    return self.status_resistance or 22
end