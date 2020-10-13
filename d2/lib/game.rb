class Game
    attr_accessor :player
    attr_accessor :enemies
    def  initialize(name)
        clear
        splash
        @player = HumanPlayer.new(name)
        puts @player.class == HumanPlayer
        @enemies = []
        4.times {@enemies.push(Player.new(namer))}
        while self.is_still_going?
            @player_left = @enemies.length
            @player.play
            @enemies.each do |enemy| 
                if enemy.is_alive != true
                    self.kill_player(enemy)
                else
                    enemy.attacks(@player)
                end
            end
        end
        self.end
    end
    def kill_player(player)
        @enemies.delete(player)
    end
    def is_still_going?
        return @player.is_alive && enemies.length != 0
    end
    def show_players
        @player.show_state
        @enemies.each{|enemy| puts "#{enemy.name} a #{enemy.life_points}/#{enemy.full}PV"}
    end
    def end
        clear
        align_center
        if @player.is_alive
            center "tu es venu a bout de tous les ennemis"
        else
            center "comment t'as fait pour kanner?"
        end
    end
    def new_players_in_sight
        d = self.dice
        if @player_left == 4 || d = 1
            return
        end
        if d <= 4
            name = namer
            @enemies.push(Player.new(name))
            puts "il y a un nouvel ennemi, #{name} apparait!"
        else
            name = namer
            @enemies.push(Player.new(name))
            puts "il y a un nouvel ennemi, #{name} apparait!"
            name = namer
            @enemies.push(Player.new(name))
            puts "il y a un nouvel ennemi, #{name} apparait!"
        end
    end
end