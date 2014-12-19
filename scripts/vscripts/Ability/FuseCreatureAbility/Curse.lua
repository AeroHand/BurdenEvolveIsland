function Curse(keys)
	local caster = keys.caster
	local target = keys.target
	target:SetContextNum("CurseTime", 0, 0)
	target:SetContextThink(DoUniqueString("CurseUnit"),
	function()
		if target:GetContext("CurseTime") <=5 then
			target:SetContextNum("CurseTime", target:GetContext("CurseTime")+1, 0)
			return 1
		else
			local damage_table = {
                                    victim = target,
                                    attacker = caster,
                                    damage =caster:GetMana(),
                                    damage_type = DAMAGE_TYPE_MAGICAL, 
                                    damage_flags = 0
                                }
    		ApplyDamage(damage_table)
    		print(target:GetHealth())
			if target:GetHealth() > 0 then
				caster:SetHealth(50)
				caster:SetMana(0)
				return nil
			else
				caster:SetHealth(caster:GetMaxHealth())
				caster:SetMana(caster:GetMaxMana())
				caster:ModifyGold(100,true, 0)
				--caster:AddExperience(999,true,nil)
			end
		end
	end
		,0)
end