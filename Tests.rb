require_relative 'Character'
require_relative 'Question'

class Tests

	def initialize
		@score = 0
	end
	
	def strengthTest(char,opponent)
		threads = []
		threads << Thread.new {
			while(char.health > 0 && opponent.health > 0)				
				sleep(10-char.speed)
				if(Random.rand(100) > opponent.dodge)
					opponent.health -= char.strength
					if(checkDead(char,opponent))
						threads.each{ |thr| thr.exit unless thr == Thread.current}
						break
					else
						puts( "#{char.name} attacked #{opponent.name} for #{char.strength}" )
						puts( "#{opponent.name} has #{opponent.health} health remaining" )
					end
				else
					puts ( "#{opponent.name} has dodged #{char.name} 's attack.")
				end
			end			
		}
		threads << Thread.new {
			while(opponent.health > 0 && char.health > 0)
				sleep(10-opponent.speed)
				if(Random.rand(100) > char.dodge)
					char.health -= opponent.strength
					if(checkDead(char,opponent))
						threads.each{ |thr| thr.exit unless thr == Thread.current}
						break
					else
						puts( "#{opponent.name} attacked #{char.name} for #{opponent.strength}" )
						puts( "#{char.name} has #{char.health} health remaining" )
					end
				else
					puts ( "#{char.name} has dodged #{opponent.name} 's attack")
				end
			end
		}
		
		threads.each { |thr| thr.join }
	end
	
	def checkDead(char,opponent)
		if(char.health <= 0)
				puts()
				puts ("#{char.name} is defeated by #{opponent.name}")
				puts("You lose!")
				return true
		elsif(opponent.health <= 0)
				puts()
				puts ("#{opponent.name} is defeated by #{char.name}")
				puts("You win!")
				@score += 20
				return true
		else
				return false
		end				
	end

	def intelligenceTest(char)
			
		questions = []

		questions << Question.new("In the song The Twelve Days of Christmas, how many calling birds are there?",
									"4",
									"2",
									"3",
									"5")
		questions << Question.new("In football, what is the diameter of the centre circle?",
									"20 yards",
									"5 yards",
									"10 yards",
									"15 yards")
		questions << Question.new("According to legend, who was the religious member of Robin Hood's band of outlaws?",
									"Friar Tuck",
									"Alan-a -Dale",
									"Little John",
									"Will Scarlet")
		questions << Question.new("What was the name of Patrick Macnee's character in the TV series The Avengers?",
									"John Steed",
									"John Steel",
									"John Stride",
									"John Strong")
		questions << Question.new("Who was known as 'The Lady with the Lamp'?",
									"Florence Nightingale",
									"Grace Darling",
									"Fanny Craddock",
									"Margaret Thatcher")
		questions << Question.new("Which of these is an alternative name for tetanus?",
									"Lockjaw",
									"Mumps",
									"Shingles",
									"Whooping cough")
		questions << Question.new("The entertainer Uri Geller was born in which country?",
									"Israel",
									"Hungary",
									"Switzerland",
									"Syria")
		questions << Question.new("In Greek mythology, who was the goddess of love?",
									"Aphrodite",
									"Athena",
									"Hera",
									"Venus")
		questions << Question.new("The alcoholic beverage kirsch is made from which fruit?",
									"Cherries",
									"Apples",
									"Melons ",
									"Pineapples")
		questions << Question.new("What is bezique?",
									"French card game",
									"Greek bread",
									"Swiss cheese",
									"Turkish Delight")
									
		questions.shuffle!
		count = 0
		
		for i in 0..4 do
			questions[i].printQuestion(char.intelligence)
			puts("Enter your answer: ")
			response = gets().chomp().to_i() - 1
			if(questions[i].checkAnswer(char.intelligence,response))
				puts ("Correct!")
				puts()
				@score += 2
				count += 1
			else
				puts("Wrong!")
				puts()
			end
		end
		if(count == 5)
			puts("Congratz, you answered all of the questions correctly!")
		else
			puts("You scored #{count} out of 5!")
		end
	end
	
	def speedTest(char)
		
		words = []
		words << ("quick when every put side")		
		words << ("car see went girl long")		
		words << ("walk that night land men")		
		words << ("through later line play and")		
		words << ("tell group old move got")		
		words << ("both water part end found")		
		words << ("never she as carry are")		
		words << ("song began above do will")		
		words << ("to state begin along write")		
		words << ("use might came hand down in")
		words.shuffle!
		
		puts("For the following test you are supposed to copy the text presented in a short time period. \nPress enter when you are ready.")
		gets()
		startTime = Time.now
		words.each_with_index {|word,index|
			puts (words[index])
			response = gets().chomp()
			while( response != words[index])
				puts (words[index])
				response = gets().chomp()
			end
		}
		endTime = Time.now
		totalTime = endTime-startTime
		puts()
		puts ("You have completed the speed test in #{totalTime} seconds.")	
		
		if(char.speed <3)
			if(totalTime <= 50)
				@score += 10
				puts("Congratz,you passed the speed test!")
			else
				puts("You have failed the speed test!")
			end
		elsif(char.speed < 5 && char.speed >= 3)
			if(totalTime <= 55)
				@score += 10
				puts("Congratz,you passed the speed test!")
			else
				puts("You have failed the speed test!")
			end
		elsif(char.speed < 8 && char.speed >= 5)
			if(totalTime <= 60)
				@score += 10
				puts("Congratz,you passed the speed test!")
			else
				puts("You have failed the speed test!")
			end
		else
			if(totalTime <= 65)
				@score += 10
				puts("Congratz,you passed the speed test!")
				puts()
			else
				puts("You have failed the speed test!")
				puts()
			end
		end			
		
	end
	
	def displayResult
		@score = @score*2.50
		puts()
		puts("Your total test score: #{@score}")
		puts()
		if(@score >= 70)
			puts("Congratulations, you passed!")
		else
			puts("Fai... Better luck next time!")
		end	
	end

end