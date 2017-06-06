class Character

	attr_reader :name, :speed, :strength, :intelligence,:dodge
	attr_accessor :health
	
	def initialize(name,speed,strength,intelligence,health,dodge)		
		@name = name
		@speed = speed
		@strength = strength
		@intelligence = intelligence
		@health = health
		@dodge = dodge
		@weapon
	end
	
	def setWeapon(weapon)
		@weapon = weapon
		puts "#{@name} picked #{@weapon.name}"
		@weapon.buff(self)
	end
	
	def buffChar(speedBuff,strengthBuff,intelligenceBuff,dodgeBuff)
		@speed += speedBuff
		@strength += strengthBuff
		@intelligence += intelligenceBuff		
		@dodge += dodgeBuff
		puts "Buffed stats :"
		printStats
	end
	
	def printStats
		puts "Name: " + @name
		puts "Speed: #{@speed}"  
		puts "Strength: #{@strength}" 
		puts "Intelligence: #{@intelligence}"
		puts "Health: #{@health}" 
		puts "Dodge: #{@dodge}" 
	end
		
			 
end

