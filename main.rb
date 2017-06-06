require_relative 'Character'
require_relative 'Ciri'
require_relative 'Geralt'
require_relative 'Earth_Elemental'
require_relative 'Mage'
require_relative 'Detlaff'
require_relative 'Dwarf'
require_relative 'Elf'
require_relative 'Weapon'
require_relative 'Blade'
require_relative 'Bow'
require_relative 'Staff'
require_relative 'Axe'
require_relative 'Claws'
require_relative 'Tests'


def main
	
	chars = []
	chars << Ciri.new()
	chars << Geralt.new()
	chars << Earth_Elemental.new()
	chars << Mage.new()
	chars << Detlaff.new()
	chars << Dwarf.new()
	chars << Elf.new()	
	
	weapons = []
	weapons << Blade.new()
	weapons << Bow.new()
	weapons << Staff.new()
	weapons << Axe.new()
	weapons << Claws.new()	
	
	puts( "Characters:")
	chars.each_with_index {|char,index|
		 puts "#{index} => "
		 puts "#{char.printStats}"  		
	}
	puts "Select a character:"
	charChoice = gets.chomp().to_i
	puts( "#{chars[charChoice].name} is selected")
	
	opp = Random.rand(chars.length)
	while(opp == charChoice)
		opp = Random.rand(chars.length)
	end
	
	puts( "You will face #{chars[opp].name} ")
	puts()	
	
	puts( "Weapons:")
	weapons.each_with_index {|weapon,index|
		 puts "#{index} => #{weapon.name}"		  
	}
	puts "Select a weapon:"	
	
	weaponChoice = gets.chomp().to_i
	puts()
	#puts( "#{weapons[weaponChoice].name} is selected")	
	chars[charChoice].setWeapon(weapons[weaponChoice])	
	puts()
	
	oppWeapon = Random.rand(weapons.length)
	while(oppWeapon == weaponChoice)
		oppWeapon = Random.rand(weapons.length)
	end
	chars[opp].setWeapon(weapons[oppWeapon])
	puts()
	
	threeTest = []
	threeTest << "Battle Test"
	threeTest << "Intelligence Test"
	threeTest << "Speed Test"
	
	test = Tests.new()
	
	for i in 1..3 do
		selectTest(threeTest)
		testChoice = gets.chomp().to_i - 1
		
		if(threeTest[testChoice] == "Battle Test")
			puts("#{chars[charChoice].name} using #{weapons[weaponChoice].name}  vs. #{chars[opp].name} using #{weapons[oppWeapon].name}.")
			puts("Press enter to start the battle.")
			gets()
			test.strengthTest(chars[charChoice],chars[opp])
			puts()
			threeTest.delete_at(testChoice)
		elsif(threeTest[testChoice] == "Intelligence Test")
			puts("Press enter to proceed with the intelligence test.")
			gets()
			test.intelligenceTest(chars[charChoice])
			puts()
			threeTest.delete_at(testChoice)
		elsif(threeTest[testChoice] == "Speed Test")
			puts("Press enter to proceed with the speed test.")
			gets()
			test.speedTest(chars[charChoice])
			threeTest.delete_at(testChoice)
		else
			puts ("Not available")
			redo
		end
		
	end
	
	puts()
	test.displayResult()
	
end

def selectTest(threeTest)
	puts "Select a test:"
	threeTest.each_with_index {|selectedTest,index|
		puts(" #{index+1} --> #{selectedTest}")
	}
end


main