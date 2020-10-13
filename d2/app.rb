require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'


playerO = Player.new("robert")
playerT = HumanPlayer.new("Boris")

playerT.search_weapon

while playerO.life_points > 0 && playerT.life_points > 0

    puts "voici l'etat de chaque joueurs : \n \t #{playerO.name} a #{playerO.life_points} / #{playerO.full}PV\n \t #{playerT.name} a #{playerT.show_state} / #{playerT.full}PV \n \n \n"

    puts "Passons à la phase d'attaque"

    playerT.attacks(playerO)

    playerO.attacks(playerT)

end

puts playerT.weapon_level