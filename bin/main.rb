#!/usr/bin/env ruby
def new_player
  puts 'player one choose a symbol x or o ?'
  user_symbol = gets.chomp
  case user_symbol
  when 'x'
    fplayers = 'x'
    splayers = 'o'
  when 'o'
    fplayers = 'o'
    splayers = 'x'
  else
    puts 'wrong inputs try again'
    new_player
  end
  puts "player one has the sign #{fplayers}"
  puts "player two has the sign #{splayers}"
  puts
end

new_player

def board
  puts ' 1 | 2 |  3'
  puts ' 4 | 5 |  6'
  puts ' 7 | 8 |  9'

  puts 'make your move!!!!'
  move = gets.chomp
  if move < '9' && move > '0'
    puts 'good choice'
  else
    puts 'wrong move try again'
    board
  end
end
board
