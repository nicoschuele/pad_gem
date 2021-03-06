#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'pad_utils'
require 'PADGEM_GEM_RUBY_NAME'

start_time = Time.now
number_of_tests = 0
errors_list = []

# CLI argument to select which test area to run.
# Example: ruby test_runner.rb user
area = ARGV[0]
test_files = area.nil? ? "*_test.rb" : "#{area}*"

# Add preconditions to running tests just below this line.
# For example, ENV['MY_APP'] = 'development'

puts

PadUtils.puts_c "Running tests...", :blue

Dir["units/#{test_files}"].each do |file|
  require_relative file

  class_name = PadUtils.filename_to_classname(file)

  clazz = PadUtils.filename_to_class(file)
  c = clazz.new(class_name)
  errors = c.run

  if errors[:errors] > 0
    errors_list << errors
  end

  number_of_tests += 1
end

end_time = Time.now
interval = PadUtils.interval start_time, end_time, :seconds

PadUtils.puts_c "Finished running #{number_of_tests} tests in #{interval} seconds", :blue
if errors_list.length > 0
  PadUtils.puts_c "--> Failed (#{errors_list.length}): ", :error
  errors_list.each do |err|
    PadUtils.puts_c "- #{err[:name]}: #{err[:errors]} error(s)"
  end
else
  PadUtils.puts_c "--> 0 errors", :green
end
puts
