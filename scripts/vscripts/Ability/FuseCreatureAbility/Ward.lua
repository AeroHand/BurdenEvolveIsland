function Ward(keys)
	local caster = keys.caster 
	local unit = CreateUnitByName("FuseWard", caster:GetOrigin()+RandomVector(300), false, caster, caster, caster:GetTeam()) 
	unit:SetContextNum("SpawnTime", 0, 0) 
	unit:SetControllableByPlayer(caster:GetPlayerID() , true)
	unit:SetForwardVector(unit:GetForwardVector()*(-1))
	unit:SetContextThink(DoUniqueString("Ward"), 
	function()
		if unit:GetContext("SpawnTime")<=20 then
			unit:SetContextNum("SpawnTime", unit:GetContext("SpawnTime")+1, 0)
			return 1
		else
			unit:Kill(nil, nil) 
			return nil
		end 
	end, 1) --[[Returns:void
	Set a think function on this entity.
	]]
end