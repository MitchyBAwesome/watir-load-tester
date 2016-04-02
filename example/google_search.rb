require 'watir-webdriver'

browser = Watir::Browser.new
searches = ['Watir','Watir Development Builds', 'Watir Performance Testing', 'Watir New Process', 'ruby-debug']
browser.goto('google.com')

searches.each do |search|
  browser.text_field(:name => 'q').set search
  browser.button(:name => 'btnG').click
end

browser.close
