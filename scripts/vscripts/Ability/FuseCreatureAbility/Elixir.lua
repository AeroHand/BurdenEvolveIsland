function Elixir(keys)
	local caster = keys.caster
	local target = keys.unit
	if target:IsHero() then
		caster:ModifyGold(target:GetLevel()*50+10,true, 0)
	end
end
--