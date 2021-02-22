#!/usr/bin/env ruby
require_relative '../lib/settings'
require_relative '../lib/logic'
player = Player.new
puts player.game_name
# player sign just valdiate that the use Enter the correct symbol
def players(sign, player)
  state = true
  while state
    if player.sign_validate(sign)
      puts "player #{sign} make the move"
      break
    else
      puts 'enter the correct value'
      sign = gets.chomp
    end
  end
  sign
end

# move_check which takes the user input and validate input for number between 1 and 9 and make move on the board
def move_check(move, array, var, player)
  state = true
  while state
    if player.move_validate(move) && player.index_taken(move - 1, array)
      array[move - 1] = var
      break
    else
      puts 'enter the correct value'
      move = gets.chomp.to_i
    end
  end
end
b = Settings.new
array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts 'choose the player (1 is x) or (2 is o)'
sign = gets.chomp
sign = players(sign, player)

# draw if no wins just print draw
def draw
  puts 'its a draw'
  puts "Game Ended ! \u{1F61C}"
end

i = 0
while i < 9
  move = gets.chomp.to_i
  move_check(move, array, sign, player)
  puts b.draw_board(array).to_s
  if player.wins(array, sign)
    puts "player #{sign} wins \u{1F911}"
    break
  end
  if i == 8
    draw
    break
  end
  sign = b.flip_user(sign)
  puts "player #{sign} make the move"
  i += 1
end
