require 'pad_utils'

module PadGem
  module Generator

    def self.generate(options)
      # Copy the foundation template
      copy_foundation(options[:gem_ruby_name])

    end

    def self.copy_foundation(dir_name)
      padgem_dir = "#{File.dirname(__FILE__)}/.."
      PadUtils.copy_all_files("#{padgem_dir}/foundation", dir_name)
    end
  end
end
