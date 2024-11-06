merc_abillity_spectre = class({})

function merc_abillity_spectre:OnSpellStart()
	--this is where the ability actually happens

	--reading the values from the kv file
	local radius = self:GetSpecialValueFor( "damage_radius" )
	local dmg = self:GetSpecialValueFor( "self_damage" )
	local dur = self:GetSpecialValueFor("duration")
	local initls = self:GetSpecialValueFor("ls_start")

	-- when we start the spell, look for units (heroes and creeps) nearby, and deal damage
	local caster = self:GetCaster()
		local dmgtype = nil
		dmgtype = DAMAGE_TYPE_PURE

		-- the damage parameter for each unit
		local tabel = {
						victim = caster,
						attacker = self:GetCaster(),
						damage = dmg,
						damage_type = dmgtype,
						damage_flags = DOTA_DAMAGE_FLAG_NON_LETHAL, -- Optional, more can be added with + .. No flags = 0.
						ability = self	-- Optional, but we have an ability here (=self)
					}
		ApplyDamage( tabel ) -- deal damage

	-- now we add a modifier to the caster, that makes him have lifesteal for some time
	self:GetCaster():AddNewModifier(
						self:GetCaster(), -- handle caster,
						self, -- handle optionalSourceAbility,
						"merc_abillity_spectre_modifier", -- string modifierName,
						{ duration = dur, damage = dmg } -- handle modifierData)
	)
end



-------------------------------------------------------------------------------------------------------------------------------
-- everything down from here is a modifier. LinkLuaModifier adds it to the game, so the AddNewModifier(..) knows where to find it.

--               modifiername used below ,       filepath            , weird valve thing
LinkLuaModifier( "merc_abillity_spectre_modifier", "abilities/merc_abillity_spectre", LUA_MODIFIER_MOTION_NONE )

merc_abillity_spectre_modifier = class({})

function merc_abillity_spectre_modifier:GetTexture() return "item_lifesteal" end

function merc_abillity_spectre_modifier:OnCreated( kv )
	-- we have to read the "damage" number from the AddNewModifer(..) to use it.
	self.damage = kv.damage
end

function merc_abillity_spectre_modifier:OnRefresh( kv )
	self.damage = kv.damage
end

function merc_abillity_spectre_modifier:DeclareFunctions()
	return {
		-- MODIFIER_EVENT_ON_ATTACK_LANDED, -- OnAttackLanded (check the link below)
		-- MODIFIER_EVENT_ON_TELEPORTED, -- OnTeleported 
		 MODIFIER_PROPERTY_MANA_BONUS, -- GetModifierManaBonus 

		-- can contain everything from the API
		-- https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools/Scripting/API

	}
end

function merc_abillity_spectre_modifier:GetModifierManaBonus(event) -- MODIFIER_PROPERTY_MANA_BONUS
	return 100
end

-- function merc_abillity_spectre_modifier:OnAttackLanded(event) -- MODIFIER_EVENT_ON_ATTACK_LANDED
-- 	if self:GetParent()~=event.attacker then return end
-- 	self:GetParent():Heal(self.lifesteal, self:GetAbility())
-- 	self:GetParent():newParticleEffect(BUTT_PARTICLE_LIFESTEAL)
-- 	self.lifesteal = self.lifesteal / 2
-- end