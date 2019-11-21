require 'nokogiri'
require 'pry'
require 'open-uri'
#require 'watir'
#require 'selenium-webdriver'

@headline_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " "}
@url_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " "}

binding.pry

def welcome_menu
	puts "Welcome to Awoke! Select by story, news source, or use our randomizer."
	puts "For story selection, type ‘story'"
	puts "For source selection, type ‘source'"
	puts "For randomizer, type ‘random'"
	puts "To exit, type ‘exit’"
	input_1 = gets.strip
	if input_1 == “exit”
		puts "Thanks for using Awoke!"
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
	if input_2.to_i(1, 3)
	  story_text_array.each do |item|
	    if item[0] == ("#{input_2}")
		    puts item
		    end_story_prompt
		else
		  menu_redirect
		end
	end
end
	
def source_printer
	puts “1. #{Source 1}”
	puts “2. #{Source 2}”
	puts “3. #{Source 3}”
	puts "Please select a source by number (1, 2, 3):"
	input_3 = gets.strip
	if input_3.to_i(1, 3)
		source_array.each do |item|
		  if item[0] == ("#{input_3}")
		    puts item
		    end_story_prompt
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

def headline_and_source_generator
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  title_aclu = doc_aclu.css('span.is-uppercase').text 
  if !!"#{title_aclu}".match(/\w/)
    @headline_hash[:ACLU] = title_aclu
  else
    puts "Waiting on ACLU headline..."
  end
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  title_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
  if !!title_amnesty.match(/\w/)
    @headline_hash[:Amnesty] = title_amnesty
  else
    puts "Waiting on Amnesty International headline..."
  end
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  title_hrw = doc.css('h3.billboard-title')
  if !!title_hrw.match(/\w/)
    @headline_hash[:HRW] = title_hrw
  else
    puts "Waiting on Human Rights Watch headline..."
  end
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  title_splc = doc_splc.css("div.field-item even")
  if !!title_splc.match(/\w/)
    @headline_hash[:SPLC] = title_splc
  else
    puts "Waiting on SPLC headline..."
  end
end
end

def url_generator
  ########################ACLU#######################
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  
  ###########Amnesty###############
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  title_splc = doc_splc.css("div.field-item even")
  
  ##########HRW#############
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  title_splc = doc_splc.css("div.field-item even")
  
  #########SPLC###############
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  step_1 = doc_splc.css("section#highlighted")
  step_2 = step_1.css("div.field-items")
  step_3 = step_2[0].children
  step_4 = step_3[1].children.text
  step_5 = "#{step_4.match(/https.*\w/)}"
  ############################
end
end
  
  


#def google_url_generator
  #url_array = [ ]
  #########################
  #html_aclu = open("https://google.com/search?q='#{@headline_hash[:ACLU]}'")
  #3doc_aclu = Nokogiri::HTML(html_aclu)
  #########################
  #html_amnesty = open("https://google.com/search?q='#{@headline_hash[:Amnesty]}'")
  #doc_amnesty = Nokogiri::HTML(html_amnesty)
  #########################
  #html_hrw = open("https://google.com/search?q='#{@headline_hash[:HRW]}'")
  #doc_hrw = Nokogiri::HTML(html_hrw)
  #########################
  #split_title = @headline_hash[:SPLC].split
  
  
  
  
  #html_splc = open("https://google.com/search?q=#{@headline_hash[:SPLC]}, splc")
  #doc_splc = Nokogiri::HTML(html_splc)
  #attempt_1 = doc_splc.css("div#main")
  
  
  
  
  
  #temp_array = [ ]
  #splc_hrefs = doc_splc.css("a").map { |anchor| anchor["href"] }
  #splc_hrefs.each do |item|
    #if item.scan(/splc.org/)
      #temp_array << item
    #end
  #end
  
  #########################

#def author_generator
  #final_splc_link_array = [ ]
  #splc_max_word = @headline_hash[:SPLC].split.max{|a, b| a.length <=> b.length}
  #html_splc = open("https://www.splc.org")
  #doc_splc = Nokogiri::HTML(html_splc)
  ##article_link_splc = doc_splc.css("div.field field-name-field-link field-type-link-field field-label-hidden")
  #href_array_splc = doc_splc.css("a")
  #href_array_splc.each do |item|
    #if item.attributes["href"].value.include?(splc_max_word)
      
      
      #final_splc_link_array << item
    #end
  #end
  
  #pry(main)> lala[30].children[1].children[0].text
 
  #final_splc_link_array
#end
#end




      
      
#lala[0].attributes["href"].value