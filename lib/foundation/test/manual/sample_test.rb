require_relative '../template/test'

class SampleTest < Test

  def prepare
    # Add test preparation here
  end

  def run_test
    puts "This is a sample test!"
    @notes << "Sample note"
  end

  def cleanup
    # Add cleanup code here
  end

end

# Test name
test_name = "Sample"
current_test = SampleTest.new(test_name)
current_test.run
