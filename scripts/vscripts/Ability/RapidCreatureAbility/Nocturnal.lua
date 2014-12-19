function Nocturnal(keys)
	local DON = GameRules:IsDaytime()
	local caster = keys.caster 
	if DON then
		if caster:HasAbility("RapidCreature_Nocturnal_Night") then
			caster:RemoveAbility("RapidCreature_Nocturnal_Night") 
		end
		if not caster:HasAbility("RapidCreature_Nocturnal_Day") then
			caster:AddAbility("RapidCreature_Nocturnal_Day")
			local abi = caster:FindAbilityByName("RapidCreature_Nocturnal_Day")
			abi:SetLevel(1)
		end
	else
		if caster:HasAbility("RapidCreature_Nocturnal_Day") then
			caster:RemoveAbility("RapidCreature_Nocturnal_Day") 
		end
		if not caster:HasAbility("RapidCreature_Nocturnal_Night") then
			caster:AddAbility("RapidCreature_Nocturnal_Night")
			local abi = caster:FindAbilityByName("RapidCreature_Nocturnal_Night")
			abi:SetLevel(1)
		end
	end 
end