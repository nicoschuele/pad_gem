require_relative "pad_gem/version"
require_relative "pad_gem/menu"
require_relative "pad_gem/generator"

module PadGem

  def self.main(arg)
    if arg[0] == '-n' || arg[0] == '--new'
      create(Menu.ask)
    elsif arg[0] == '-v' || arg[0] == '--version'
      display_version
    else
      display_help
    end
  end

  def self.create(options)
    result = Generator.generate(options)
    if result == "success"
      puts
      puts "#{options[:gem_name]} created in #{options[:gem_ruby_name]}"
      puts
    else
      puts
      puts "Something went wrong and #{options[:gem_name]} was not created."
      puts "Status: #{result}"
      puts
    end
  end

  def self.display_help
    puts
    puts "PadGem #{PadGem::VERSION}"
    puts "************"
    puts
    puts "use padgem --new (or -n) for creating a new gem."
    puts
  end

  def self.display_version
    puts
    puts "PadGem #{PadGem::VERSION}"
    puts "by Nico Schuele (@nicoschuele)"
    puts
  end

end
