require "terminfo"
def center(string)
    if TermInfo.screen_size[1]-string.length/2 < 0
        puts string
        return
    end
    spaces = " " * ((TermInfo.screen_size[1]-string.length)/2);
    if (spaces + string + spaces).length == TermInfo.screen_size[1] - 1
        puts  (spaces + string + spaces + " ").colorize(:black).colorize( :background => :white)
    else
        puts  (spaces + string + spaces).colorize(:black).colorize( :background => :white)
    end
end

def align_center
    puts "\n" * ((TermInfo.screen_size[0])/2);
end

def splash
    system("clear")

    align_center
    center("pour une experience opitmale, veuillez mettre votre terminal en plein ecran")
    center("appuyez sur \"entre\" pour commencer")
    
    gets
    
    system("clear")
    align_center
    
    center "      O                                                             O       "
    center "{o)xxx|===============-  'ILS VEULENT TOUS MA POO'  -===============|xxx(o} "
    center "      O                                                             O       "
    center "Le but du jeu est d'être le dernier survivant !"
    
    gets
    
    system("clear")
end

def name_asker
    align_center
    center "boujour jeune humain, quel est ton nom?"
    puts " " * ((TermInfo.screen_size[1])/4) + ">".chomp
    name = gets.chomp
    name[0] = name[0].upcase
    return name
end

def warn(string)
    puts string.colorize(:red).colorize( :background => :black)
end

def clear
    system("clear")
end

def namer
    names = [
        "Boghosse",
        "Jésunette",
        "José",
        "Lancelot",
        "Titeuf",
        "Clitorine",
        "Perceval",
        "Bohort",
        "Jean-Marie",
        "Serge",
        "Arthur",
        "Jaques",
        "Antoine-Daniel",
        "powerfull NoName",
        "Rodolf",
        "Un vicking",
        "le frommage"
    ]
    return names[rand(names.length-1)]
end