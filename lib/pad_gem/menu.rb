require 'pad_utils'
require_relative 'version'

module PadGem
  module Menu

    def self.ask
      # TODO: sanitize the values given and provide default options.
      puts
      puts "PadGem #{PadGem::VERSION}"
      puts "************"
      puts

      options = Hash.new
      options[:gem_name] = PadUtils.question_menu("Name of your gem")
      options[:gem_name] = PadUtils.sanitize(options[:gem_name])
      options[:gem_name] = PadUtils.convert_to_ruby_name(options[:gem_name])
      options[:executable] = PadUtils.question_menu("Gem executable name")
      options[:ruby_version] = PadUtils.question_menu("Minimum Ruby version")
      options[:author] = PadUtils.question_menu("Your name")
      options[:email] = PadUtils.question_menu("Your email address")
      options[:homepage] = PadUtils.question_menu("Homepage url for #{options[:gem_name]}")
      options[:gem_ruby_name] = PadUtils.underscore(options[:gem_name])
      options[:year] = Date.today.year.to_s
      puts
      options
    end

  end
end
