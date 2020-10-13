require 'bundler'
Bundler.require
require_relative 'lib/displays.rb'
require_relative 'lib/game'
require_relative 'lib/player'

splash

player = HumanPlayer.new(name_asker)

enemies = [
    Player.new("Josiane"),
    Player.new("Jose")
]

while player.is_alive && (enemies[0].is_alive || enemies[1].is_alive)
    player.play
    enemies.each{|enemy| enemy.attacks(player)}
end