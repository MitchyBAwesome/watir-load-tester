Watir Load Tester
=================

This was taken from an [old article](http://wiki.openqa.org/display/WTR/Re-Usable+Load+Testing+Example) regarding Load Test. I have modified it so that it can be called easily via CLI.

    Usage: watir-load-tester [Script] [Itterations] [# of users] [Delay] [Logfile]

    Script       The watir script you are testing
    Itterations  How many times you want this script to run
                    Empty will default to 1
    # of users   How many users you want to use
                    Empty will default to 1
    Delay        How much time you want between users
                    Empty will default to 0
    Logfile      Where you want your logfile to go to
                    Empty will default to current directory


Example Script
=================
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

If you have questions, please open a ticket or email enroxorz(the 'at' symbol)gmail(a dot)com
