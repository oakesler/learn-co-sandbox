require 'watir'

browser = Watir::Browser.new 

browser.goto('https://www.aclu.org/news/')

puts browser.a

browser.close





#require 'watir'
#require 'nokogiri'

#url = "https://www.aclu.org/news/"

#browser = Watir::Browser.new :phantomjs

#browser.goto(url)

#sleep(4)

#html_doc = Nokogiri::HTML(browser.html)

#puts html_doc.css(h1).text 

#browser.close