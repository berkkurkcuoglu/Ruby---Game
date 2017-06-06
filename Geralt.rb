require_relative 'Character'

class Geralt < Character
	def initialize
		super("Geralt",7,80,6,800,30)
	@specialWeapon = "Blade"
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