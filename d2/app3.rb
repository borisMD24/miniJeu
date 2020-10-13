
require 'bundler'
Bundler.require
require_relative 'lib/displays.rb'
require_relative 'lib/game'
require_relative 'lib/player'
clear
my_game = Game.new(name_asker)