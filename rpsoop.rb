# players pick a hand of either r p s 
# two cands are compared and its either a tie if hands are same

# player , hands

class Player
  attr_accessor :choice
  attr_reader :name
  
  def initialize(n)
    @name = n
  end

  def to_s
  "#{name} has a choice of #{choice}"
  end

end


class Human < Player
  def pick_hand
    begin
      puts "pick one (r,p,s)"
      choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(choice)

  end
end


class Computer < Player
  
  def pick_hand
    self.choice = Game::CHOICES.keys.sample
  end
end

class Game

  CHOICES = {"r"=>"Rock", "p"=>"Paper", "s"=>"Scissors"}
  
  attr_reader :player, :computer

  def initialize 
    @player = Human.new("bob")
    @computer = Computer.new("BASH")
  end
  
  def winning_message(win)
    case win
    when 'p'
      puts "paper wraps rock"
    when 'r'
      puts "rock smashed scissors"
    when 's'
      puts 'scissors cuts paper'
    end
end

  def compare_hands
  if player.choice == computer.choice
    puts "its a tie"
  elsif player.choice == 'p' && computer.choice == 'r' || player.choice =='r' && computer.choice =='s'|| player.choice =='s' && computer.choice == 'p'
      winning_message(player.choice)
      puts "you won"
    else
      winning_message(computer.choice)
      puts "the computer won"
    end
  end


  def play
    player.pick_hand
    computer.pick_hand
    compare_hands
  end

end

  game = Game.new.play