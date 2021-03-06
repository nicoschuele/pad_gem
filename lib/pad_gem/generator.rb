require 'pad_utils'

module PadGem
  module Generator

    def self.generate(options, path = nil)
      target_path = path == nil ? options[:gem_ruby_name] : "#{path}/#{options[:gem_ruby_name]}"

      # Don't start generation if directory exists
      if PadUtils.file_exist?(target_path)
        return "A directory with the name of this gem already exists."
      end

      # Copy the foundation template
      copy_foundation(target_path)

      # Replace the placeholder texts in newly copied foundation
      replace_placeholders(options, path)

      # Rename files according to the new gem name
      rename_files(options, path)

      if options[:executable]
        # Make the executable ...well... executable
        system "chmod +x #{target_path}/bin/#{options[:executable]}"
      else
        # Or delete it and remove traces of it in gemspec
        PadUtils.delete_directory "#{target_path}/bin"
        PadUtils.replace_line_containing(
        "spec.executables",
        in_file: "#{target_path}/#{options[:gem_ruby_name]}.gemspec",
        new_value: ""
        )
      end

      # Return success
      "success"

    rescue Exception => e
      PadUtils.set_log_path "#{ENV["HOME"]}/pad_gem_logs"
      PadUtils.log("An error happened while generating the new gem", e)
      "failure"
    end

    def self.copy_foundation(dir_name)
      padgem_dir = "#{File.dirname(__FILE__)}/.."
      PadUtils.copy_all_files("#{padgem_dir}/foundation", dir_name)
    end

    def self.replace_placeholders(options, path = nil)
      # Within the new gem dir
      target_path = path == nil ? options[:gem_ruby_name] : "#{path}/#{options[:gem_ruby_name]}"
      Dir.chdir "#{target_path}" do

        # README.md
        PadUtils.replace_in_file("README.md", /PADGEM_GEM_NAME/, options[:gem_name])
        PadUtils.replace_in_file("README.md", /PADGEM_AUTHOR/, options[:author])
        PadUtils.replace_in_file("README.md", /PADGEM_YEAR/, options[:year])

        # foundation.gemspec
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_GEM_NAME/, options[:gem_name])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_MIN_RUBY_VERSION/, options[:ruby_version])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_AUTHOR/, options[:author])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_EMAIL/, options[:email])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_HOMEPAGE/, options[:homepage])
        PadUtils.replace_in_file("foundation.gemspec", /PADGEM_EXECUTABLE/, options[:executable])

        # bin/exec
        PadUtils.replace_in_file("bin/exec", /PADGEM_GEM_NAME/, options[:gem_name]) if options[:executable]
        PadUtils.replace_in_file("bin/exec", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name]) if options[:executable]

        # lib/foundation.rb
        PadUtils.replace_in_file("lib/foundation.rb", /PADGEM_GEM_NAME/, options[:gem_name])
        PadUtils.replace_in_file("lib/foundation.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # lib/foundation/version.rb
        PadUtils.replace_in_file("lib/foundation/version.rb", /PADGEM_GEM_NAME/, options[:gem_name])

        # test/test_runner.rb
        PadUtils.replace_in_file("test/test_runner.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # test/Gemfile
        PadUtils.replace_in_file("test/Gemfile", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # test/units/sample_test.rb
        PadUtils.replace_in_file("test/units/sample_test.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # test/template/template.rb
        PadUtils.replace_in_file("test/template/template.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # test/template/test.rb
        PadUtils.replace_in_file("test/template/test.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # test/manual/manual.rb
        PadUtils.replace_in_file("test/manual/manual.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

      end
    end

    def self.rename_files(options, path = nil)
      # Within the new gem dir
      target_path = path == nil ? options[:gem_ruby_name] : "#{path}/#{options[:gem_ruby_name]}"
      Dir.chdir "#{target_path}" do

        # bin/exec
        PadUtils.move_file("bin/exec", "bin/#{options[:executable]}") if options[:executable]

        # foundation.gemspec
        PadUtils.move_file("foundation.gemspec", "#{options[:gem_ruby_name]}.gemspec")

        # lib/foundation.rb
        PadUtils.move_file("lib/foundation.rb", "lib/#{options[:gem_ruby_name]}.rb")

        # lib/foundation/
        PadUtils.move_file("lib/foundation", "lib/#{options[:gem_ruby_name]}")

      end
    end

  end
end
