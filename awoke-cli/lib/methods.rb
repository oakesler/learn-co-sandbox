require_relative "../config/environment.rb"
require "/home/oakesler/Development/awoke-cli/lib/story_object.rb"

require 'nokogiri'

require 'open-uri'


@story_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " ", :Backup => " "}
 
binding.pry

def the_aclu_headline_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  headline_aclu = doc_aclu.css('span.is-uppercase').text 
end

def the_amnesty_headline_scraper
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  headline_amnesty = "#{doc_amnesty.css('span.heading--tape').text}: #{doc_amnesty.css('p.image-headline__copy').text}"
  #headline_amnesty = doc_amnesty.css('span.heading--tape').text
  #headline_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
end

def the_hrw_headline_scraper
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  headline_hrw = doc_hrw.css('h3.billboard-title').text
end

def the_splc_headline_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  headline_splc = doc_splc.css("h1").first.text
end

#####################################################################################################
def aclu_url_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  step_a_1 = doc_aclu.css("div#hp__top_carousel")
  step_a_2 = step_a_1.css("div.columns")
  step_a_3 = step_a_2.children
  step_a_4 = step_a_3[11]
  step_a_5 = step_a_4.css("a").first
  aclu_url = step_a_5.attributes["href"].value
end

def aclu_abstract_scraper
  html_aclu = open("#{@story_hash[:ACLU].story_url}")
  doc_aclu = Nokogiri::HTML(html_aclu)
  aclu_abstract = doc_aclu.css("div#tabs").text
end

def amnesty_headline_scraper
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  headline_amnesty = "#{doc.css('span.heading--tape').text} : #{doc.css('p.image-headline__copy')}"
  headline_finisher(headline_amnesty, "Amnesty International")
end

def amnesty_url_scraper 
  html_amnesty = open("https://www.amnesty.org/en")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  step_b_1 = doc_amnesty.css("a.btn--header")
  amnesty_url = "https://www.amnesty.org/#{step_b_1}"
end 

def amnesty_abstract_scraper
  html_amnesty = open("#{@story_hash[:Amnesty].story_url}")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  amnesty_abstract = doc_amnesty.css("p").text
end

def hrw_headline_scraper
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  headline_hrw = doc.css('h3.billboard-title')
  headline_finisher(headline_hrw, "HRW")
end

def hrw_url_scraper
  html_hrw = open("https://www.hrw.org")
  doc_hrw = Nokogiri::HTML(html_hrw)
  hrw_url = "https://www.hrw.org#{doc_hrw.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
  #@url_hash[:HRW] = hrw_url
end

def hrw_abstract_scraper
  html_hrw = open("#{@story_hash[:HRW].story_url}")
  doc_hrw = Nokogiri::HTML(html_hrw)
  step_c_1 = doc_hrw.css("p")
  hrw_abstract = step_c_1[3]
end

def splc_headline_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  headline_splc = doc_splc.css("div.field-item even")
  headline_finisher(headline_hrw, "SPLC")
end

def splc_url_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  step_1 = doc_splc.css("section#highlighted")
  step_2 = step_1.css("div.field-items")
  step_3 = step_2[0].children
  step_4 = step_3[1].children.text
  #@url_hash[:SPLC] = "#{step_4.match(/https.*\w/)}"
end

def splc_abstract_scraper
  html_splc = open("#{@story_hash[:SPLC].story_url}")
  doc_splc = Nokogiri::HTML(html_splc)
  splc_abstract = doc_splc.css("p").first.text
end

######################################################################################
def aclu_object_maker
  aclu_story = Story.new("ACLU", "www.aclu.org")
  aclu_story.headline = the_aclu_headline_scraper
  @story_hash[:ACLU] = aclu_story
end

def amnesty_object_maker 
  amnesty_story = Story.new("Amnesty International USA", "www.amnestyusa.org")
  amnesty_story.headline = the_amnesty_headline_scraper
  #amnesty_story.url = amnesty_url_scraper
  #amnesty_story.abstract = abstract_generator(amnesty_story.url)
  @story_hash[:Amnesty] = amnesty_story
end

def hrw_object_maker
  hrw_story = Story.new("Human Rights Watch", "www.hrw.org")
  hrw_story.headline = the_hrw_headline_scraper
  #hrw_story.url = hrw_url_scaper
  #hrw_story.abstract = abstract_generator(hrw_story.abstract)
  @story_hash[:HRW] = hrw_story
end

def splc_object_maker
  splc_story = Story.new("Southern Poverty Law Center", "www.splcenter.org")
  splc_story.headline = the_splc_headline_scraper
  #splc_story.url = url_generator("www.splcenter.org")
  #splc_story.abstract = abstract_generator(splc_story.url)
  @story_hash[:SPLC] = splc_story
end

def execute_experiment
  aclu_object_maker
  amnesty_object_maker
  hrw_object_maker
  splc_object_maker
end

def welcome_menu
  execute_experiment
  puts "Welcome to Awoke! Select by story, news source, or use our randomizer."
	puts "For story selection, type ‘story'"
	puts "For source selection, type ‘source'"
	puts "For randomizer, type ‘random'"
	puts "To exit, type ‘exit’"
	input = gets.strip
	if input == "exit"
		puts "Thanks for using Awoke!"
		elsif input == "story"
		story_selector
		else 
		  menu_redirect
		end
  end 

def story_selector
  puts "Please select a headline by number (1-4)"
  puts "1. #{@story_hash[:ACLU].headline}"
  puts "2. #{@story_hash[:Amnesty].headline}"
  puts "3. #{@story_hash[:HRW].headline}"
  puts "4. #{@story_hash[:SPLC].headline}"
  x = gets.strip
  if input == "1"
    puts "#{@story_hash[:ACLU].source} (#{@story_hash[:ACLU].home_url})"
    puts "#{@story_hash[:ACLU].home_url}"
    puts "#{@story_hash[:ACLU].headline}"
    puts "#{@story_hash[:ACLU].story_url}"
    puts "#{@story_hash[:ACLU].abstract}"
    elsif input == "2"
    puts "#{@story_hash[:Amnesty].source} (#{@story_hash[:Amnesty].home_url})"
    puts "#{@story_hash[:Amnesty].home_url}"
    puts "#{@story_hash[:Amnesty].headline}"
    puts "#{@story_hash[:Amnesty].story_url}"
    puts "#{@story_hash[:Amnesty].abstract}"
    elsif input == "3"
    puts "#{@story_hash[:HRW].source} (#{@story_hash[:HRW].home_url})"
    puts "#{@story_hash[:HRW].home_url}"
    puts "#{@story_hash[:HRW].headline}"
    puts "#{@story_hash[:HRW].story_url}"
    puts "#{@story_hash[:HRW].abstract}"
    elsif input == "4"
    puts "#{@story_hash[:SPLC].source} (#{@story_hash[:SPLC].home_url})"
    puts "#{@story_hash[:SPLC].home_url}"
    puts "#{@story_hash[:SPLC].headline}"
    puts "#{@story_hash[:SPLC].story_url}"
    puts "#{@story_hash[:SPLC].abstract}"
  else 
    menu_redirect
  end
end
  


