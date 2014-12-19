function Melaleuca_Health_Bonus(keys)
	local caster = keys.caster
	print(caster:GetMaxHealth())
	caster:SetMaxHealth( caster:GetMaxHealth()+20)
end
function Melaleuca_Health_Raducation(keys)
		local caster = keys.caster
		print(caster:GetMaxHealth())
	caster:SetMaxHealth( caster:GetMaxHealth()-20)
end