
modifier_merc_pure_attack_damage = class({})
--------------------------------------------------------------------------------
-- Classifications
function modifier_merc_pure_attack_damage:IsHidden()
	return false
end

function modifier_merc_pure_attack_damage:IsDebuff()
	return false
end

function modifier_merc_pure_attack_damage:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_merc_pure_attack_damage:OnCreated( kv )
	self.parent = self:GetParent()
	self.ability = self:GetAbility()

end

function modifier_merc_pure_attack_damage:OnRefresh( kv )
end

function modifier_merc_pure_attack_damage:OnRemoved()
end

function modifier_merc_pure_attack_damage:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE
	}

	return funcs
end

function modifier_merc_pure_attack_damage:GetModifierTotalDamageOutgoing_Percentage( params )
    print("Here")
	if params.inflictor then return 0 end
	if params.damage_category~=DOTA_DAMAGE_CATEGORY_ATTACK then return 0 end
	if params.damage_type~=DAMAGE_TYPE_PHYSICAL then return 0 end
    print("Here")

		local damageTable = {
			victim = params.target,
			attacker = self.parent,
			damage = params.original_damage,
			damage_type = DAMAGE_TYPE_PURE,
			damage_flag = DOTA_DAMAGE_FLAG_NONE,
			ability = self.ability, --Optional.
		}
		ApplyDamage( damageTable )

	return -200
end
