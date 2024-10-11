item_merc_tank_buster = class({})
LinkLuaModifier("item_merc_tank_buster_modifier", LUA_MODIFIER_MOTION_NONE)

function item_merc_tank_buster:GetIntrinsicModifierName()
  return "item_merc_tank_buster_modifier"
end