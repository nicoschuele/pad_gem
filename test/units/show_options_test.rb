require 'pad_utils'
require 'pad_gem'
require_relative '../template/test'

# Test name
test_name = "ShowOptions"

class ShowOptionsTest < Test

  def prepare
    # Add test preparation here
  end

  def run_test
    options = PadUtils.json_file_to_hash("fixtures/from_menu.json")
    options.each do |k,v|
      puts "#{k}: #{v}"
    end
  end

  def cleanup
    # Add cleanup code here
  end

end
