merc_ogre_magi_multicast = class({})
LinkLuaModifier( "modifier_merc_ogre_magi_multicast", "modifiers/modifier_merc_ogre_magi_multicast", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_merc_ogre_magi_multicast_proc", "modifiers/modifier_merc_ogre_magi_multicast_proc", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Passive Modifier
function merc_ogre_magi_multicast:GetIntrinsicModifierName()
	return "modifier_merc_ogre_magi_multicast"
end

--------------------------------------------------------------------------------
-- Item Events
function merc_ogre_magi_multicast:OnInventoryContentsChanged( params )
	-- local caster = self:GetCaster()

	-- -- get data
	-- local scepter = caster:HasScepter()
	-- local ability = caster:FindAbilityByName( "ogre_magi_unrefined_fireblast_lua" )

	-- -- if there's no ability, why bother
	-- if not ability then return end

	-- ability:SetActivated( scepter )
	-- ability:SetHidden( not scepter )

	-- if ability:GetLevel()~=1 then
	-- 	ability:SetLevel( 1 )
	-- end
end