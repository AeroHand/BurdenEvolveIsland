-- Generated from template
IsInitTalent = false
if BurdenEvolveIslandGameMode == nil then
	BurdenEvolveIslandGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	PrecacheUnitByNameSync("FuseWard", context) --[[Returns:void
	Precaches a DOTA unit by its dota_npc_units.txt name
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = BurdenEvolveIslandGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function BurdenEvolveIslandGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:SetHeroSelectionTime( 15.0 )
	GameRules:SetPreGameTime( 5.0 )
	local GameMode = GameRules:GetGameModeEntity()
	--GameMode:SetContextThink("BurdenEvolveIslandThink", Dynamic_Wrap( BurdenEvolveIslandGameMode, 'OnThink' ), 0.1 )
	ListenToGameEvent( "dota_player_gained_level", Dynamic_Wrap( BurdenEvolveIslandGameMode, "OnPlayerLevelUp" ), self )
	ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( BurdenEvolveIslandGameMode, "OnGameRuleStateChange" ), self )
end
function BurdenEvolveIslandGameMode:OnGameRuleStateChange(event)
	print("OnThink!!!")
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then 
	  
	end
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then  
		if IsInitTalent == false then
			IsInitTalent = true
			InitTalent()
		end
	end
end
function BurdenEvolveIslandGameMode:OnPlayerLevelUp(event)
	
	print("the addon_game_mode is=>",GameRules:GetGameModeEntity())

	local id=event.player-1 

	--caculate skil points
	local heroEnt=PlayerResource:GetSelectedHeroEntity(id)
	 heroEnt:SetAbilityPoints(0)

end
function BurdenEvolveIslandGameMode:InitPoint(keys)
	local entindex = keys.index+1
	local player = EntIndexToHScript(entindex)
	local plyID = player:GetPlayerID()
	local heroEnt=PlayerResource:GetSelectedHeroEntity(plyID)
	heroEnt:SetAbilityPoints(0)
end
-- Evaluate the state of the game
function BurdenEvolveIslandGameMode:OnThink()
	
end
HeroTalentAbility = {
					{"npc_dota_hero_venomancer",{"",""}},
					{"npc_dota_hero_ursa",{}},
					{"npc_dota_hero_nyx_assassin",
						{"SpineCreatureAbility_Withstand","SpineCreatureAbility_Defense","SpineCreatureAbility_Shell",
						 "SpineCreatureAbility_Dodge","SpineCreatureAbility_Scrappy","SpineCreatureAbility_Melaleuca",
						 "SpineCreatureAbility_Mail","SpineCreatureAbility_God_Mail","SpineCreatureAbility_Icy_Mail",
						 "SpineCreatureAbility_Leather_Armour","bristleback_bristleback","medusa_mana_shield"
						}
					},
					{"npc_dota_hero_slark",{}},
					{"npc_dota_hero_enigma",{}}
					}
function InitTalent()
	for i=0,9 do
			if PlayerResource:IsValidPlayer( i ) then
				local heroEnt=PlayerResource:GetSelectedHeroEntity(i)
				if heroEnt~=nil then
					for k,target in pairs(HeroTalentAbility) do
						if heroEnt:GetName() == target[1] then
							heroEnt:AddAbility(target[2][RandomInt(1,#target[2])])
						end 
					end
				end
			end
	end
end