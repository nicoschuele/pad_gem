require 'rubygems'
require 'bundler/setup'
require 'pad_utils'
require 'pad_gem'

options = PadGem::Menu::ask
PadUtils.hash_to_json_file("#{File.dirname(__FILE__)}/../fixtures/from_menu.json", options)
