if GameSetup == nil then
    GameSetup = class({})
  end

  function GameSetup:init()
    if IsInToolsMode() then  --debug build    
    else --release build
      local GameMode = GameRules:GetGameModeEntity()

      --put your rules here
      GameRules:SetSameHeroSelectionEnabled(true)
      GameRules:SetHeroSelectionTime(180)
      GameRules:SetStrategyTime(45)
      GameRules:SetCustomGameSetupAutoLaunchDelay(60)
      -- GameMode:SetDaynightCycleAdvanceRate(1.3)
      GameMode:SetDaynightCycleDisabled(false)
      -- GameMode:SetThink( "OnThink", self, "GlobalThink", 2 )
    end
  end
