require_relative '../lib/settings'
require_relative '../lib/logic'
array = ['x', 2, 3, 'o', 5, 6, 'x', 'x', 9]
player = Player.new

describe Player do
  describe '#game_name' do
    it 'return string' do
      player.game_name.eql?('Wlecome to tic tac toe')
    end
  end

  describe '#sign_validate' do
    it 'return true or false' do
      player.sign_validate('x').eql?(true)
      player.sign_validate('o').eql?(true)
      player.sign_validate('s').eql?(false)
    end
  end

  describe '#move_validate' do
    it 'return true or false' do
      player.move_validate('1').eql?(true)
      player.move_validate('10').eql?(false)
      player.move_validate('0').eql?(false)
    end
  end
end
