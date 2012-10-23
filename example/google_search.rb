require 'watir-classic'
require 'watir-classic/contrib/ie-new-process'

browser = Watir::IE.new_process
browser.set_fast_speed

searches = ['Watir','Watir Development Builds', 'Watir Performance Testing', 'Watir New Process', 'ruby-debug']
browser.goto('google.com')
searches.each do |search|
  browser.text_field(:name => 'q').when_present.set(search)
  browser.button(:name => 'btnG').when_present.click_no_wait
end
browser.close
