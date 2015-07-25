class Player
  attr_accessor :name,:lives
  def initialize(name)
    @name = name
    @lives = 3
  end
end

class MathGame
    attr_accessor :player1, :player2

    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
    end

  def switch(player)

    if player == @player2
       new_player = @player1
    else
       new_player = @player2
    end
    return new_player
  end

  def play
    current_player = @player2

    while current_player.lives > 0

      current_player = switch(current_player)
      num1 = 1 + rand(20)
      num2 = 1 + rand(20)
      puts "#{current_player.name}: What does #{num1} + #{num2} equal?"
      ans = gets.chomp

      if ans != num1 + num2
        current_player.lives -= 1
      end
    end
    return switch(current_player)
  end
end


puts "Please enter first player:"
player1_name = gets.chomp
puts "Please enter second player:"
player2_name = gets.chomp

player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

game = MathGame.new(player1,player2)
puts game.inspect

puts "The winner of the game is #{game.play.name}"



