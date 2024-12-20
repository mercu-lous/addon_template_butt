modifier_item_merc_mind_of_the_leviathan = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_item_merc_mind_of_the_leviathan:IsHidden()
	-- actual true
	return false
end

function modifier_item_merc_mind_of_the_leviathan:IsPurgable()
	return false
end

function modifier_item_merc_mind_of_the_leviathan:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE -- Allows the modifier to be stacked multiple times
end

function modifier_item_merc_mind_of_the_leviathan:OnCreated( kv )

    self.starting_mana = self:GetAbility():GetSpecialValueFor("starting_mana")
    self.stacking_mana= self:GetAbility():GetSpecialValueFor("stacking_mana")
	self.currentMana = self.starting_mana
end

function modifier_item_merc_mind_of_the_leviathan:OnRefresh( kv )
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_item_merc_mind_of_the_leviathan:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_HERO_KILLED,
		MODIFIER_PROPERTY_MANA_BONUS,
	}
	return funcs
end

function modifier_item_merc_mind_of_the_leviathan:OnHeroKilled( params )
	if not IsServer() then return end
	if params.attacker == self:GetParent() then
		print("Hero Slane")
		self.currentMana = self.currentMana + self.stacking_mana
		self:GetParent():CalculateStatBonus( true )
		print("Hero Slane 2")
	end
end


function modifier_item_merc_mind_of_the_leviathan:GetModifierManaBonus()
	return self.currentMana
end