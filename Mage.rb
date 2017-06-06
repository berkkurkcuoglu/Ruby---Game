require_relative 'Character'

class Mage < Character
	def initialize
		super("Mage",6,80,8,500,35)
	@specialWeapon = "Staff"
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