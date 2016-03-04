require 'pad_utils'
require 'pad_gem'
require_relative '../template/test'

# Test name
test_name = "Generator"

class GeneratorTest < Test

  def prepare
    # Deletes directory if it already exists
    PadUtils.delete_directory("results/foo_bar")
  end

  def run_test
    options = PadUtils.json_file_to_hash("fixtures/options.json")

    # Generate once. Should be ok.
    success = PadGem::Generator.generate(options, "results")
    if success != "success"
      @errors << "Generation reported a failure."
    end

    # Generate twice. Should abort.
    success = PadGem::Generator.generate(options, "results")
    if success != "A directory with the name of this gem already exists."
      @errors << "Something wrong with second generation"
    end

  end

  def cleanup
    # Add cleanup code here
  end

end
