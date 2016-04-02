require 'thread'
require 'optparse'
# Main watir-load-tester class
class WatirLoadTester
  # Load Testing Tool to allow you to utilize Watir-Classic's IE.new_process
  # Example:
  #   watir-load-tester test-script.rb 3 5 1 c:\results.log
  #     test-script    - The script you wrote
  #     3              - How many times you are running this test
  #     5              - How many users you are simulating
  #     1              - The delay between users
  #     c:\results.log - Where I want my output

  #def self.load_test(testScript,num_itterations=1,num_users=1,delay_between_users=0, log_file_name = Dir.pwd + '/load_test.log')
  def self.load_test(myoptions) # Method invoked using a hash of options which allows for named arguments and variable argument lengths. (https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls#Variable_Length_Argument_List.2C_Asterisk_Operator
    total_passing = 0
    total_failing = 0
    log = File.open(myoptions[:log_file_name],"a")

    log.puts("\n\n*********************************\n**Load Test Configuration: num_itterations=#{myoptions[:num_itterations]}, num_users=#{myoptions[:num_users]}, delay_between_users=#{myoptions[:delay_between_users]} seconds.")

    (1..myoptions[:num_itterations]).each do |iteration|
      itteration_passing = 0
      itteration_failing = 0
      log.puts("**Begining Itteration #{iteration} - #{Time.now.strftime(" %m/%d/%y @ %H:%M:%S ") }")
      i=0
      threads = []
      myoptions[:num_users].times  do  #each thread simulates a user running the specified testScript
          threads << Thread.new do
            i=i+1
            startTime = Time.now
            result = system("ruby #{myoptions[:testScript]}")  #execute the script and wait for it to finish.
            duration = Time.now-startTime
            if result  #Record our results.
              itteration_passing = itteration_passing +1
              log.puts("Thread #{i} executed #{myoptions[:testScript]} Successfully - Duration = #{duration}seconds")
            else
              itteration_failing = itteration_failing + 1
              log.puts("Thread #{i} executed #{myoptions[:testScript]} FAILED - Duration = #{duration}seconds")
            end
          end
        sleep(myoptions[:delay_between_users])  #Wait for the specified delay_between_users before we start the next user/thread.
      end
      threads.each {|t| t.join}
      log.puts("**Finished Itteration #{iteration}. #{itteration_passing} out of #{myoptions[:num_users]} tests Passed - #{Time.now.strftime(" %m/%d/%y @ %H:%M:%S ") }")
      total_passing = total_passing + itteration_passing
      total_failing = total_failing + itteration_failing
    end
    log.puts("**Load Test complete.  #{total_passing} out of #{myoptions[:num_users]*myoptions[:num_itterations]} tests Passed")
    log.close
  end
end
