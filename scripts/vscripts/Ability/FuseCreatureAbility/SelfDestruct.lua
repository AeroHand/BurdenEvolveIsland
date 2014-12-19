function SelfDestruct(keys)
	local caster = keys.caster
	local teams=DOTA_UNIT_TARGET_TEAM_ENEMY
	local types=DOTA_UNIT_TARGET_BASIC+DOTA_UNIT_TARGET_HERO
	local flags=DOTA_UNIT_TARGET_FLAG_NONE
	local unit = FindUnitsInRadius(teams,caster:GetOrigin(),nil,300,teams,types,flags,FIND_CLOSEST,true)

	for _,target in pairs(unit) do 
		 print(target:GetName() )
		 local damage_table = {
                                    victim = target,
                                    attacker = caster,
                                    damage =caster:GetHealth(),
                                    damage_type = DAMAGE_TYPE_PURE, 
                                    damage_flags = 0
                                }
    	ApplyDamage(damage_table)
	end
	caster:Kill(nil,nil)
end
--[[local inc=GetDistance(caster,hero)/40
	 	 hero:SetContextThink("xiyin",
	 	 	function ()
	 	 		
	 	 		if(GetDistance(caster,hero)<=75) then return nil end  --防止卡主
	 	 		local pos=hero:GetOrigin()+caster:GetForwardVector()*(-1)*(inc)
	 	 		hero:SetOrigin(pos)
	 	 		count=count+1
	 	 		if count>total_count then
	 	 			 return nil 
	 	 		else
	 	 			 return sec/total_count
	 	 		end


	 	 	end]]