item_merc_dragon_lance_3 = class({})
LinkLuaModifier("item_merc_attack_range_booster_modifier", LUA_MODIFIER_MOTION_NONE)

function item_merc_dragon_lance_3:GetIntrinsicModifierName()
  return "item_merc_attack_range_booster_modifier"
end