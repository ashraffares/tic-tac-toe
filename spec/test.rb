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

  describe '#index_taken' do
    it 'return true or false' do
      player.index_taken(0, array).eql?(true)
      player.index_taken(3, array).eql?(true)
      player.index_taken(5, array).eql?(false)
    end
  end

  describe '#wins' do
    it 'return true or false' do
      player.wins(array, 'x').eql?(true)
      player.wins(array, 'o').eql?(false)
    end
  end
end

describe Settings do
  describe '#flip_user' do
    it 'return x or o' do
      setting = Settings.new
      setting.flip_user('x').eql?('o')
      setting.flip_user('o').eql?('x')
    end
  end

  describe '#draw_board' do
    it 'return board on screen' do
      setting = Settings.new
      setting.draw_board(array).eql?('')
    end
  end
end
