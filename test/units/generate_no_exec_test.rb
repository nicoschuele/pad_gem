require 'pad_utils'
require 'pad_gem'
require_relative '../template/test'

# Test name
test_name = "GenerateNoExec"

class GenerateNoExecTest < Test

  def prepare
    # Deletes directory if it already exists
    PadUtils.delete_directory("results/bar_foo") if PadUtils.file_exist? "results/bar_foo"
  end

  def run_test
    options = PadUtils.json_file_to_hash("fixtures/no_exec.json")

    success = PadGem::Generator.generate(options, "results")
    if success != "success"
      @errors << "Generation reported a failure."
    end

    if PadUtils.file_exist? "results/bar_foo/bin"
      @errors << "The executable still exists."
    end

    gemspec_content = PadUtils.get_file_content "results/bar_foo/bar_foo.gemspec"
    if gemspec_content.include? "spec.executables"
      @errors << "The executable is referenced in gemspec"
    end

  end

  def cleanup
    # Add cleanup code here
  end

end
