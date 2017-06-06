class Weapon

	attr_reader :name
	
	def initialize(name,speed,strength,intelligence,dodge)		
		@name = name
		@speed = speed
		@strength = strength
		@intelligence = intelligence		
		@dodge = dodge
	end
	
	def buff(character)
		character.buffChar(@speed,@strength,@intelligence,@dodge)
	end
	
	def weaponMultiplier(multi)		
		@strength += @strength * multi
		@intelligence += @intelligence	* multi			
	end
		
end





