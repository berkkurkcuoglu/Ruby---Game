require_relative 'Character'

class Dwarf < Character
	def initialize
		super("Dwarf",5,90,4,500,30)
		@specialWeapon = "Axe"
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