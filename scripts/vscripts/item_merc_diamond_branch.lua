item_merc_diamond_branch = class({})
LinkLuaModifier("item_merc_branch_modifier", LUA_MODIFIER_MOTION_NONE)

function item_merc_diamond_branch:GetIntrinsicModifierName()
  return "item_merc_branch_modifier"
end