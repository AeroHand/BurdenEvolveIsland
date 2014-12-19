function DamageApply(keys)
	local caster = keys.caster
	local target = keys.attacker
	 local damage_table = {
                                    victim = target,
                                    attacker = caster,
                                    damage =0.1*caster:GetMaxHealth(),
                                    damage_type = DAMAGE_TYPE_MAGICAL, 
                                    damage_flags = 0
                                }
    ApplyDamage(damage_table)
end