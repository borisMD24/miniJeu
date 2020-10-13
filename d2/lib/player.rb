class Player
    def initialize(name)
        @name = name
        @life_points = 10
        @full = @life_points
    end
    def name
        @name
    end
    def full
        @full
    end
    def life_points
        @life_points
    end
    def show_state
        puts @life_points
        return @life_points
    end
    def gets_damage(n, atackant = nil)
        @life_points -= n
        if @life_points <= 0
            warn "le joueur #{@name} a ete tue!"
        end
        if atackant == nil
            return
        end
        if atackant.class == HumanPlayer
            warn "#{@name} riposte!"
            attacks(atackant)
        end
    end
    def attacks(player, its = nil)
        if @life_points > 0
            warn "#{@name} attaque #{player.name}"
            attack_power = self.compute_damage
            player.gets_damage(attack_power, its)
            warn "il lui inflige #{attack_power} points de dommages"
        end
    end
    def compute_damage
        return dice
    end
    def dice
        return rand(1..6)
    end
    def is_alive
        return @life_points > 0
    end
end

class HumanPlayer < Player
    def initialize(name)
        super
        @life_points = 100
        @full = @life_points
        @weapon_level = 1
    end
    def compute_damage
        dice * @weapon_level
    end
    def search_weapon
        weapon_level = dice
        warn "Tu as trouvé une arme de niveau #{weapon_level}"
        if weapon_level > @weapon_level
            @weapon_level = weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end
    def weapon_level
        @weapon_level
    end
    def search_health_pack
        d = dice
        if d == 1
            warn "Tu n'as rien trouvé... "
        elsif d == 6
            warn  "Bravo, tu as trouvé un pack de +80 points de vie !"
            @life_points += 80
        else
            warn "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points += 50
        end
        if @life_points > 100
            @life_points = 100
        end
    end
    def menu
        my_game.new_players_in_sight
        if self.is_alive == false
            return
        end
        puts "Quelle action veux-tu effectuer ? \n \n \t a - chercher une meilleure arme \n \t s - chercher à se soigner \n \n attaquer un joueur en vue :"
        i = 0
        enemies = {}
        ObjectSpace.each_object(Player) do |player|
            if player != self && player.is_alive
                puts "#{i} - #{player.name} a #{player.life_points} points de vie"
                enemies[i] = player
                i+=1
            end
        end
        menu_choice(enemies)
    end
    def menu_choice(enemies)
        a = gets.chomp
        puts a.ord
        if (a.ord >= 97 && a.ord <= 122)
            if a == "a"
                self.search_weapon
            elsif a == "s"
                self.search_health_pack
            else
                system "clear"
                puts "veuillez prendre une option valide"
                self.play
            end
        elsif (a.ord >=48  && a.ord <= 57)
            if a.to_i < enemies.length
                self.attacks(enemies[a.to_i])
            else
                system "clear"
                puts "veuillez prendre une option valide"
                self.play
            end
        end
        return
    end
    def play
        if self.is_alive == false
            return
        end
        puts "Quelle action veux-tu effectuer ? \n \n \t a - chercher une meilleure arme \n \t s - chercher à se soigner \n \n attaquer un joueur en vue :"
        i = 0
        enemies = {}
        ObjectSpace.each_object(Player) do |player|
            if player != self && player.is_alive
                puts "#{i} - #{player.name} a #{player.life_points} points de vie"
                enemies[i] = player
                i+=1
            end
        end
        a = gets.chomp
        puts a.ord
        if (a.ord >= 97 && a.ord <= 122)
            if a == "a"
                self.search_weapon
            elsif a == "s"
                self.search_health_pack
            else
                system "clear"
                puts "veuillez prendre une option valide"
                self.play
            end
        elsif (a.ord >=48  && a.ord <= 57)
            if a.to_i < enemies.length
                self.attacks(enemies[a.to_i], self)
            else
                system "clear"
                puts "veuillez prendre une option valide"
                self.play
            end
        end
        return
    end
end