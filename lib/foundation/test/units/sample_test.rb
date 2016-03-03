require 'pad_utils'
require 'PADGEM_GEM_RUBY_NAME'
require_relative '../template/test'

# Test name
test_name = "SampleTest"

class Tester < Test

  def prepare
    puts "I'm preparing..."
  end

  def run_test
    puts "Running the test..."
  end

  def cleanup
    puts "Cleaning up after the test..."
  end

end

t = Tester.new(test_name)
t.run
