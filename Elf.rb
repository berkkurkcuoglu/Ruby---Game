require_relative 'Character'

class Elf < Character
	def initialize
		super("Elf",7,50,6,450,35)
		@specialWeapon = "Bow"
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
