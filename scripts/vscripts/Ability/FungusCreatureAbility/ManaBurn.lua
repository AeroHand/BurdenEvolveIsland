function ManaBurn(keys)
	local target = keys.target
	local caster  = keys.caster
	target:SetMana(target:GetMana()-300)
	if(target:GetMana()<=200) then
		local damage_table = {
                                    victim = target,
                                    attacker = caster,
                                    damage =500,
                                    damage_type = DAMAGE_TYPE_MAGICAL, 
                                    damage_flags = 0
                                }
    	ApplyDamage(damage_table)
    	else
    		local damage_table = {
                                    victim = target,
                                    attacker = caster,
                                    damage =300,
                                    damage_type = DAMAGE_TYPE_MAGICAL, 
                                    damage_flags = 0
                                }
    		ApplyDamage(damage_table)
	end

end