modifier_merc_movespeed_absolute = class({})

function modifier_merc_movespeed_absolute:IsHidden() return false end
function modifier_merc_movespeed_absolute:IsPurgable() return false end
function modifier_merc_movespeed_absolute:RemoveOnDeath() return false end

function modifier_merc_movespeed_absolute:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,    
    }
    return funcs
end

function modifier_merc_movespeed_absolute:OnCreated() 
    self.movespeed_cap = self:GetAbility():GetSpecialValueFor( "movespeed_cap" )
end

function modifier_merc_movespeed_absolute:GetModifierMoveSpeed_Absolute()
    return self.movespeed_cap
end
