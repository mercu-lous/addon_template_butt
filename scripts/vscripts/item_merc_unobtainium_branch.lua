item_merc_unobtainium_branch = class({})
LinkLuaModifier("item_merc_branch_modifier", LUA_MODIFIER_MOTION_NONE)

function item_merc_unobtainium_branch:GetIntrinsicModifierName()
  return "item_merc_branch_modifier"
end