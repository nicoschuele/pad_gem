#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'pad_utils'
require 'PADGEM_GEM_RUBY_NAME'

# TODO: Use a function from PadUtils
def time_diff_sec(start, finish)
   result = ((finish - start)).to_i
   result == 0 ? 1 : result
end

start_time = Time.now
number_of_tests = 0

puts

PadUtils.puts_c "Running tests...", :blue

Dir["units/*_test.rb"].each do |file|
  require_relative file
  number_of_tests += 1
end

end_time = Time.now

PadUtils.puts_c "Finished running #{number_of_tests} tests in #{time_diff_sec start_time, end_time} seconds", :blue
puts
