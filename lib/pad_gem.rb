require_relative "pad_gem/version"
require_relative "pad_gem/menu"

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
    # TODO: implement creation of the gem based on the options hash
  end

  def self.display_help
    puts
    puts "PadGem #{PadGem::VERSION}"
    puts "************"
    puts
    puts "use padgem --new for creating a new gem."
    puts
  end

  def self.display_version
    puts
    puts "PadGem #{PadGem::VERSION}"
    puts "by Nico Schuele (@nicoschuele)"
    puts
  end

end
