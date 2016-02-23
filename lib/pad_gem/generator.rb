require 'pad_utils'

module PadGem
  module Generator


    def self.generate(options)
      # Don't start generation if directory exists
      if PadUtils.file_exist?(options[:gem_ruby_name])
        return "A directory with the name of this gem already exists."
      end

      # Copy the foundation template
      copy_foundation(options[:gem_ruby_name])

      # Replace the placeholder texts in newly copied foundation
      replace_placeholders(options)

      # Rename files according to the new gem name
      rename_files(options)

      # Make the executable ...well... executable
      system "chmod +x #{options[:gem_ruby_name]}/bin/#{options[:executable]}"

      # Return success
      "success"

    rescue Exception => e
      PadUtils.log_path = "#{ENV["HOME"]}/pad_gem_logs"
      PadUtils.log("An error happened while generating the new gem", e)
      "failure"
    end

    def self.copy_foundation(dir_name)
      padgem_dir = "#{File.dirname(__FILE__)}/.."
      PadUtils.copy_all_files("#{padgem_dir}/foundation", dir_name)
    end

    def self.replace_placeholders(options)
      # Within the new gem dir
      Dir.chdir "#{options[:gem_ruby_name]}" do

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
        PadUtils.replace_in_file("bin/exec", /PADGEM_GEM_NAME/, options[:gem_name])
        PadUtils.replace_in_file("bin/exec", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # lib/foundation.rb
        PadUtils.replace_in_file("lib/foundation.rb", /PADGEM_GEM_NAME/, options[:gem_name])
        PadUtils.replace_in_file("lib/foundation.rb", /PADGEM_GEM_RUBY_NAME/, options[:gem_ruby_name])

        # lib/foundation/version.rb
        PadUtils.replace_in_file("lib/foundation/version.rb", /PADGEM_GEM_NAME/, options[:gem_name])

      end
    end

    def self.rename_files(options)
      # Within the new gem dir
      Dir.chdir "#{options[:gem_ruby_name]}" do

        # bin/exec
        PadUtils.move_file("bin/exec", "bin/#{options[:executable]}")

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
