require 'peep'
describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      messages = peeps.map(&:message)

      expect(messages).to include('Ciao Sono Giacomo')
      expect(messages).to include('Ciao Sono Alessio')
      expect(messages).to include('Hola todos')
    end
    it 'returns all dates' do
      peeps = Peep.all
      times = peeps.map(&:time)

      expect(times).to include('2018-06-11 10:05:20')
      expect(times).to include('2017-08-03 10:05:20')
      expect(times).to include('2017-06-01 10:05:20')
    end
  end

  describe '.add' do
    it 'add new message' do
      Peep.add('some more text','2018-06-14 10:05:20')
      peeps = Peep.all
      messages = peeps.map(&:message)
      times = peeps.map(&:time)
      expect(messages).to include('some more text')
      expect(times).to include('2018-06-14 10:05:20')
    end
  end
end
