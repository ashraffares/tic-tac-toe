require_relative '../lib/settings'
require_relative '../lib/logic'
array = ['x', 2, 3, 'o', 5, 6, 'x', 'x', 9]
player = Player.new

describe Player do
  describe '#game_name' do
    it 'return string' do
      expect(player.game_name).to eql('Wlecome to tic tac toe')
    end
  end

  # sign_validate
  describe '#sign_validate' do
    it 'return true or false' do
      expect(player.sign_validate('x')).to eql(true)
      expect(player.sign_validate('o')).to eql(true)
      expect(player.sign_validate('s')).to eql(false)
      expect(player.sign_validate('m')).to eql(false)
      expect(player.sign_validate('f')).to eql(false)
      expect(player.sign_validate('r')).to eql(false)
    end
  end

  # move_validate
  describe '#move_validate' do
    it 'return true or false' do
      expect(player.move_validate('1')).to eql(true)
      expect(player.move_validate('10')).to eql(false)
      expect(player.move_validate('0')).to eql(false)
      expect(player.move_validate('10')).to eql(false)
      expect(player.move_validate('11')).to eql(false)
      expect(player.move_validate('40')).to eql(false)
    end
  end

  # index_taken
  describe '#index_taken' do
    it 'return true or false' do
      expect(player.index_taken(0, array)).to eql(false)
      expect(player.index_taken(3, array)).to eql(false)
      expect(player.index_taken(5, array)).to eql(true)
    end
  end

  describe '#wins' do
    it 'return true or false' do
      expect(player.wins(%w[x x x], 'x')).to eql(true)
      expect(player.wins(%w[o x x], 'o')).to eql(false)
      expect(player.wins(%w[o o x], 'o')).to eql(false)
      expect(player.wins(%w[o x x], 'x')).to eql(false)
      expect(player.wins(%w[o x o], 'o')).to eql(false)
      expect(player.wins(%w[x o x], 'x')).to eql(false)
    end
  end
end

describe Settings do
  describe '#flip_user' do
    it 'return x or o' do
      setting = Settings.new
      expect(setting.flip_user('x')).to eql('o')
      expect(setting.flip_user('o')).to eql('x')
    end
  end

  describe '#draw_board' do
    it 'return board on screen' do
      setting = Settings.new
      expect(setting.draw_board([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eql("\n\n\n   |   |   \n 1 | 2 | 3 \n   |   |   \n---+---+---\n   |   |   \n 4 | 5 | 6 \n   |   |   \n --+---+-- \n   |   |   \n 7 | 8 | 9 \n   |   |   \n\n\n")
    end
  end
end
