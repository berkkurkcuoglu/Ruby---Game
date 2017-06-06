class Question
	def initialize(question,a,b,c,d)
		@question = question
		@rightAnswer = a
		@answers3 = []
		@answers5 = []
		@answers7 = []
		@answers3 << a
		@answers3 << b
		@answers3 << c
		@answers3 << d
		@answers5 << a
		@answers5 << b
		@answers5 << c
		@answers7 << a
		@answers7 << b
		@answers3.shuffle!
		@answers5.shuffle!
		@answers7.shuffle!
	end
		
	def printQuestion(intelligence)
		puts("Q: #{@question}")
		if(intelligence < 3)
			puts ("1) #{@answers3[0]}")
			puts ("2) #{@answers3[1]}")
			puts ("3) #{@answers3[2]}")
			puts ("4) #{@answers3[3]}")
		elsif(intelligence < 5 && intelligence >= 3)
			puts ("1) #{@answers5[0]}")
			puts ("2) #{@answers5[1]}")
			puts ("3) #{@answers5[2]}")
		else
			puts ("1) #{@answers7[0]}")
			puts ("2) #{@answers7[1]}")
		end
	end
	
	def checkAnswer(intelligence,response)
		if(intelligence < 3)
			return @answers3[response] == @rightAnswer
		elsif(intelligence < 5 && intelligence >= 3)
			return @answers5[response] == @rightAnswer
		else
			return @answers7[response] == @rightAnswer
		end
	end
end
