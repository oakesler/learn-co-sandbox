story_text_array = [ ]
source_array = [ ]

def welcome_menu
	puts    “Welcome to Awoke! Select by story, news source, or use our randomizer.”
	puts    “For story selection, enter ‘story’”
	puts    “For source selection, enter ‘source’”
	puts    “For randomizer, enter ‘random’”
	puts    “To exit, enter ‘exit’”
	input_1 = gets.strip
	if input_1 == “exit”
		puts “Thanks for using Awoke!”
	else
		story_generator(input_1)
	end 
end

def story_generator(input_1)
  if input_1 == “story”
    story_printer
    elsif input_1 == “source”
    source_printer
		puts “1. #{Source 1}”
		puts “2. #{Source 2}”
		puts “3. #{Source 3}”
		puts “Please select a source by number (1, 2, 3)”
		input_3 = gets.strip
		if input_3.to_i (1, 3)
		  source_array.each do |item|
		    if item[0] == ("#{input_3}")
		      puts item
		      end_story_prompt
		  end
		end
		
	def story_printer 
			puts “Story 1”
		puts “Story 2”
		puts “Story 3”
		puts “Please select a story by number (1, 2, 3)”
		input_2 = gets.strip
		if input_2.to_i (1, 3)
		  story_text_array.each do |item|
		    if item[0] == ("#{input_2}")
		      puts item
		    end_story_prompt
		  end
		end
	end
	
	def source_printer
		puts “1. #{Source 1}”
		puts “2. #{Source 2}”
		puts “3. #{Source 3}”
		puts “Please select a source by number (1, 2, 3)”
		input_3 = gets.strip
		if input_3.to_i (1, 3)
		  source_array.each do |item|
		    if item[0] == ("#{input_3}")
		      puts item
		      end_story_prompt
		    end
		  end
		end
	end
	
	def randomizer 
	  index_array = [ ]
	  x = story_text_array.length - 1 
	  y = 0 
	  while y <= x
	    index_array << y 
	  end 
	  
	  z = index_array.sample 
	  
	
	
		
		
		
		
		
		#if input_2 == 1
			#puts “1. #{Story 1}”
			#end_story_prompt
			#elsif input_2 == 2
			#puts “2. #{Story 2}”
			#end_story_prompt
			#elsif input_2 == 3
			#puts “3. #{Story 3}”
			#end_story_prompt
	elsif input_1 == “source”
		puts “1. #{Source 1}”
		puts “2. #{Source 2}”
		puts “3. #{Source 3}”
		puts “Please select a source by number (1, 2, 3)”
		input_3 = gets.strip
		if input_3 == “1”
			puts “1. #{Source 1}”
			end_story_prompt
		elsif input_3 == “2”
			puts “2. #{Source 2}”
			end_story_prompt
		elsif input_3 == “3”
			puts “3. #{Source 3}”
			end_story_prompt
	elsif input_1 == “random”
		puts “#{story object}”
		puts “View story or regenerate?”
		input_4 = gets.strip
		if input_4 == “View story”
			puts “#{story_object.text}
		elsif input_4 == “regenerate”
			puts “#{story object}
	else
		puts “Invalid input, returning to main menu”
		welcome_menu
		end
	end
end
end