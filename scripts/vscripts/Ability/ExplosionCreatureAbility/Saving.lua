function Saving(keys)
	if keys.unit:IsHero() then
		keys.ability:ApplyDataDrivenModifier(keys.caster, keys.caster,"KillHeroAttackUp", nil)
	end
end 