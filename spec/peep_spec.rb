require 'peep'
describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('Ciao Sono Giacomo')
      expect(peeps).to include('Ciao Sono Alessio')
      expect(peeps).to include('Hola todos')
    end
  end

  describe '.add' do
    it 'add new message' do
      Peep.add('some more text')
      peeps = Peep.all

      expect(peeps).to include('some more text')
    end
  end
end
