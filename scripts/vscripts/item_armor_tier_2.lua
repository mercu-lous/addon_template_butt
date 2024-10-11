item_armor_tier_2 = class({})
LinkLuaModifier("item_cast_range_booster_modifier_merc", LUA_MODIFIER_MOTION_NONE)

function item_armor_tier_2:GetIntrinsicModifierName()
  return "item_cast_range_booster_modifier_merc"
end