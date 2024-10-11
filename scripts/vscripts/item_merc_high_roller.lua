item_merc_high_roller = class({})
LinkLuaModifier("item_merc_high_roller_modifier", LUA_MODIFIER_MOTION_NONE)

function item_merc_high_roller:GetIntrinsicModifierName()
  return "item_merc_high_roller_modifier"
end