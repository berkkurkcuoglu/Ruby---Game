require_relative 'Character'

class Earth_Elemental < Character
	def initialize
		super("Earth_Elemental",4,100,1,1000,20)
	@specialWeapon = "Claws"
	end
	
	def setWeapon(weapon)
		if(@specialWeapon == weapon.name)
			weapon.weaponMultiplier(0.5)
			super(weapon)
		else
			super(weapon)
		end
	end
end
