require_relative 'Character'

class Detlaff < Character
	def initialize
		super("Detlaff",7,60,6,600,40)
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