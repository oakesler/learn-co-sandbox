story_object_array = [ ]
source_array = [ ]

def welcome_menu
	puts "Welcome to Awoke! Select by story, news source, or use our randomizer."
	puts "For story selection, type ‘story'"
	puts "For source selection, type ‘source'"
	puts "For randomizer, type ‘random'"
	puts "To exit, type ‘exit’"
	input_1 = gets.strip
	if input_1 == “exit”
		puts “Thanks for using Awoke!”
	elsif input_1 == "story" || input_1 == "source" || input_1 == "random"
		story_generator(input_1)
		else 
		  menu_redirect
	end 
end

def story_generator(input_1)
  if input_1 == "story"
    story_printer
    elsif input_1 == "source"
    source_printer
    elsif input_1 == "random"
    randomizer
  else
    menu_redirect
	end
end
		
def story_printer
  puts "#{Story 1}"
	puts "#{Story 2}"
	puts "#{Story 3}"
	puts "Please select a story by number (1, 2, 3)"
	input_2 = gets.strip
	if input_2.to_i (1, 3)
		story_text_array.each do |item|
		  if item[0] == ("#{input_2}")
		    puts item
		    end_story_prompt
		  end
		else
		  menu_redirect
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
		else 
		  menu_redirect
		end
	end
end
	
def index_array_generator 
	 index_array = [ ]
	 y = 0 
	 while y <= story_object_array.length - 1
	  index_array << y 
	  y += 1
	 end
	 randomizer(index_array)
	end
	
def randomizer(array)
  z = array.sample
  story = story_object_array[z].name
  array.delete(z)
  randomizer_selector(story)
end
	
def randomizer_selector(story)
  puts "To continue reading, type 'continue'"
	puts "To generate a new story, type 'new'"
	input_7 = gets.strip
	if input_7 == "continue"
	  puts "#{story_object_array[z].author}"
	  puts "#{story_object_array[z].text}"
	  end_story_prompt
	  elsif input_7 == "new"
	  x = index_array.sample
	    puts story_object_array[x]
	    
	    else
	      welcome_menu
	    end 
	  end
	end
	
	def menu_redirect
	  puts "Sorry, we don't recognize that input. Returning to main menu..."
	  welcome_menu
	end