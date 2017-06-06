require_relative 'Character'

class Ciri < Character
	def initialize
		super("Ciri",8,60,4,300,60)
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