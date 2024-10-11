item_armor_tier_1 = class({})
LinkLuaModifier("item_cast_range_booster_modifier_merc", LUA_MODIFIER_MOTION_NONE)

function item_armor_tier_1:GetIntrinsicModifierName()
  return "item_cast_range_booster_modifier_merc"
end