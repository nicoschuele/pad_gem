require 'pad_utils'
require 'PADGEM_GEM_RUBY_NAME'
require_relative '../template/test'

# Test name
test_name = "TEST_NAME"

class Tester < Test

  def prepare
    # Add test preparation here
  end

  def run_test
    # Test code for TEST_NAME goes here
    #
    # Runtime errors will be handled by a Rescue in the parent class
    #
    # You can add error messages to @errors
    #   example: @errors << "Some error message"
    # You can also add notes to @notes
    #   example: @notes << "Some note"
    puts "TEST_NAME not implemented"
  end

  def cleanup
    # Add cleanup code here
  end

end

# This will run the test automatically when calling test_runner.rb
t = Tester.new(test_name)
t.run
