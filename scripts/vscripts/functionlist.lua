function GetAbilityLength(entity)
	for i = 0,15 do
		if entity:GetAbilityByIndex(i) == nil then
			return i
		end
	end
end