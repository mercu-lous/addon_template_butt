modifier_merc_knockback = class({})

function modifier_merc_knockback:IsHidden() return false end
function modifier_merc_knockback:IsPurgable() return false end
function modifier_merc_knockback:RemoveOnDeath() return false end

function modifier_merc_knockback:DeclareFunctions()
    local funcs = {
        MODIFIER_EVENT_ON_ATTACK_LANDED,
    }
    return funcs
end

function modifier_merc_knockback:OnAttackLanded(params)
    if IsServer() then
        if params.attacker == self:GetParent() then
            local target = params.target
            if target and not target:IsNull() and target:IsAlive() then
                -- Knockback parameters
                local knockback = {
                    should_stun = 0,
                    knockback_duration = 0.1,
                    duration = 0.1,
                    knockback_distance = 200,  -- Distance to knock back
                    knockback_height = 0,
                    center_x = self:GetParent():GetAbsOrigin().x,
                    center_y = self:GetParent():GetAbsOrigin().y,
                    center_z = self:GetParent():GetAbsOrigin().z,
                }

                -- Apply the knockback modifier to the target
                target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_knockback", knockback)
            end
        end
    end
end