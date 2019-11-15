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
  randomizer_selector(the_story, the_array)
end
	
def randomizer_selector(story, array)
  puts "To continue reading, type 'continue'"
	puts "To generate a new story, type 'new'"
	input_7 = gets.strip
	if input_7 == "continue"
	  puts "#{story_object_array[z].author}"
	  puts "#{story_object_array[z].text}"
	  end_story_prompt
	  elsif input_7 == "new"
	  randomizer(array)
	else
	  menu_redirect
	end
end
	
def menu_redirect
  puts "Sorry, we don't recognize that input. Returning to main menu..."
  welcome_menu
end

def headline_maker
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  @title_aclu = doc_aclu.css('span.is-uppercase').text
  ##################################################
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  @title_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
  ##################################################
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  @title_hrw = doc.css('h3.billboard-title')
  #################################################
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  @title_splc = doc.css("div.class")
  
end

def 
  #SPLC Top Story 
  #Amnesty International Top Story
  #Human Rights Watch 
  
  
  
    
  def headline_scraper(url)
    html = open("#{url}")
    doc = Nokogiri::HTML(html)
    binding.pry
    @title = doc.css('span.is-uppercase').text
  end