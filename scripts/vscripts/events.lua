ListenToGameEvent("dota_player_killed",function(keys)
	-- for k,v in pairs(keys) do print("dota_player_killed",k,v) end
	local playerID = keys.PlayerID
	local heroKill = keys.HeroKill
	local towerKill = keys.TowerKill


end, nil)

ListenToGameEvent("entity_killed", function(keys)
	-- for k,v in pairs(keys) do	print("entity_killed",k,v) end
	local attackerUnit = keys.entindex_attacker and EntIndexToHScript(keys.entindex_attacker)
	local killedUnit = keys.entindex_killed and EntIndexToHScript(keys.entindex_killed)
	local damagebits = keys.damagebits -- This might always be 0 and therefore useless

	if (killedUnit and killedUnit:IsRealHero()) then
		-- when a hero dies
	end

end, nil)
local roshan_count = 0

ListenToGameEvent("npc_spawned", function(keys)
	-- for k,v in pairs(keys) do print("npc_spawned",k,v) end
	local spawnedUnit = keys.entindex and EntIndexToHScript(keys.entindex)


	if spawnedUnit:GetName() == "npc_dota_roshan" then
		if roshan_count >= 0 then
		spawnedUnit:AddItemByName("item_merc_unstoppable")
		end
		if roshan_count == 1 then
		spawnedUnit:AddItemByName("item_merc_basher_highroller")
		end
		if roshan_count >= 2 then
		spawnedUnit:AddItemByName("item_merc_unobtainium_branch")
		end
		if roshan_count >= 3 then
		spawnedUnit:AddItemByName("item_merc_fun_2")
		end
		roshan_count = roshan_count + 1
	end

end, nil)

ListenToGameEvent("entity_hurt", function(keys)
	-- for k,v in pairs(keys) do print("entity_hurt",k,v) end
	local damage = keys.damage
	local attackerUnit = keys.entindex_attacker and EntIndexToHScript(keys.entindex_attacker)
	local victimUnit = keys.entindex_killed and EntIndexToHScript(keys.entindex_killed)
	local damagebits = keys.damagebits -- This might always be 0 and therefore useless

end, nil)

ListenToGameEvent("dota_player_gained_level", function(keys)
	-- for k,v in pairs(keys) do print("dota_player_gained_level",k,v) end
	local newLevel = keys.level
	local playerEntindex = keys.player
	local playerUnit = EntIndexToHScript(playerEntindex)
	local heroUnit = playerUnit:GetAssignedHero()
	
end, nil)

ListenToGameEvent("dota_player_used_ability", function(keys)
	-- for k,v in pairs(keys) do print("dota_player_used_ability",k,v) end
	local casterUnit = keys.caster_entindex and EntIndexToHScript(keys.caster_entindex)
	local abilityname = keys.abilityname
	local ability = casterUnit:FindAbilityByName(abilityname)
	local playerID = keys.PlayerID
	local player = keys.PlayerID and PlayerResource:GetPlayer(keys.PlayerID)

end, nil)

ListenToGameEvent("last_hit", function(keys)
	-- for k,v in pairs(keys) do print("last_hit",k,v) end
	local killedUnit = keys.EntKilled and EntIndexToHScript(keys.EntKilled)
	local playerID = keys.PlayerID
	local firstBlood = keys.FirstBlood
	local heroKill = keys.HeroKill
	local towerKill = keys.TowerKill

end, nil)

ListenToGameEvent("dota_tower_kill", function(keys)
	-- for k,v in pairs(keys) do print("dota_tower_kill",k,v) end
	local gold = keys.gold
	local towerTeam = keys.teamnumber
	local killer_userid = keys.killer_userid

end, nil)

local greedisgood = true
local thereisnospoon = true
local whosyourdaddy = true
local thicc = true
local neverdied = true
local gamble = true
local bigiron = true
local denydidwhat = true
local pizza = true

ListenToGameEvent("player_chat", function(keys)
	-- for k,v in pairs(keys) do print("dota_tower_kill",k,v) end
	local teamonly  = keys.teamonly 
	local playerid = keys.playerid
	local userid = keys.userid
	print("PID and UID  ")
	print("playerID ", playerid)
	print("userID ", userid)
	local text = keys.text
	print("Text: ", text)
	local player = PlayerResource:GetPlayer(playerid)
	local hero = player:GetAssignedHero()
	
	if (text == "greedisgood" and greedisgood) then 
		hero:ModifyGold(300, false, 8)
		greedisgood = false
	end
	if (text == "thicc" and thicc) then 
		hero:ModifyStrength(8)
		thicc = false
	end
	if (text == "neverdied" and neverdied) then 
		hero:IncrementDeaths(-1)
		hero:IncrementDeaths(-1)
		hero:IncrementDeaths(-1)
		greedisgood = false
	end
	if (text == "gamble" and gamble) then 
		local rand = math.random()
		if rand<0.5 then
			hero:ModifyGold(800, false, 8)
		end
		hero:ModifyGold(-400, false, 8)
		gamble = false
	end
	if (text == "bigiron" and bigiron) then 
		hero:AddItemByName("item_blades_of_attack")
		bigiron = false
	end
	if (text == "denydidwhat" and denydidwhat) then 
		local denies = hero:GetDenies()
		hero:ModifyGold(denies * 10, false, 8)

		denydidwhat = false
	end
	if (text == "thereisnospoon" and thereisnospoon) then 
		hero:HeroLevelUp(true)

		thereisnospoon = false
	end
	if (text == "whosyourdaddy" and whosyourdaddy) then 
		local kills = hero:GetKills()
		hero:Addexperience(300 * kills, 8, false, true)

		whosyourdaddy = false
	end
	if (text == "pizza" and pizza) then 
		hero:Addexperience(111, 8, false, true)
		hero:ModifyGold(111, false, 8)
		hero:AddItemByName("item_blood_grenade")

		pizza = false
	end

end, nil)

------------------------------------------ example --------------------------------------------------

ListenToGameEvent("this_is_just_an_example", function(keys)
	local targetUnit = EntIndexToHScript(keys.entindex)

	local neighbours = FindUnitsInRadius(
		targetUnit:GetTeam(), -- int teamNumber, 
		targetUnit:GetAbsOrigin(), -- Vector position, 
		false, -- handle cacheUnit, 
		1000, -- float radius,
		DOTA_UNIT_TARGET_TEAM_FRIENDLY, -- int teamFilter, 
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, -- int typeFilter, 
		DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, -- int flagFilter, 
		FIND_ANY_ORDER, -- int order, 
		false -- bool canGrowCache
	)

	for n,neighUnit in pairs(neighbours) do

		ApplyDamage({
			victim = neighUnit,
			attacker = targetUnit,
			damage = 100,
			damage_type = DAMAGE_TYPE_MAGICAL,
			damage_flags = DOTA_DAMAGE_FLAG_NON_LETHAL,
			ability = nil
		})

		neighUnit:AddNewModifierButt(
			targetUnit, -- handle caster, 
			nil, -- handle optionalSourceAbility, 
			"someweirdmodifier", -- string modifierName, 
			{duration = 5} -- handle modifierData
		)

	end
end, nil)
