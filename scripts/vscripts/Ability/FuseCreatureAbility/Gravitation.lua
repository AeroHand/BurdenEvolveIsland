function Gravitation(keys)
	local total_count=40
	local count=0
	local caster  = keys.caster
	local hero = keys.target
    local sec=0.5
	local inc=GetDistance(caster,hero)/40
	hero:SetContextNum("GravitationTime", 0, 0) --[[Returns:void
	SetContext( name , value, duration ): store any key/value pair in this entity's dialog contexts. Value must be a number (''int'' or ''float''). Will last for duration (set 0 to mean 'forever').
	]]
	 hero:SetContextThink("Gravitation",
	 	function ()
	 		
	 		if(GetDistance(caster,hero)<=75) then return nil end  --防止卡主
	 		local pos=hero:GetOrigin()+caster:GetForwardVector()*(-1)*(inc)
	 		hero:SetOrigin(pos)
	 		count=count+1
	 		if hero:GetContext("GravitationTime") >5 then
	 			 return nil
	 		end
	 		if count>total_count then
	 			 return nil 
	 		else
	 			 hero:SetContextNum("GravitationTime",hero:GetContext("GravitationTime")+sec/total_count,0)
	 			 return sec/total_count
	 		end


	 	end,0)
end 
function GetDistance(ent_1,ent_2)
  return	(ent_1:GetOrigin()- ent_2:GetOrigin()):Length()
end