describe Dee::Container do
  let(:container) { Dee::Container.new }

  describe '#[]' do
    it 'raises error when no defined key is specified' do
      expect { container['no_defined_key'] }.to raise_error
    end
  end

  describe '#[]=' do
    it 'sets value in container' do
      container['key'] = 'value'
      expect(container['key']).to eq('value')
    end
  end

  describe '#singleton' do
    before do
      container.singleton 'hash' do
        Hash.new
      end
    end

    it 'creates object defined in factory' do
      expect(container['hash']).to eq(Hash.new)
    end

    it 'always returns same object' do
      a = container['hash']
      expect(container['hash']).to equal(a)
    end
  end

  describe '#factory' do
    before do
      container.factory 'hash' do
        Hash.new
      end
    end

    it 'creates object defined in factory' do
      expect(container['hash']).to eq(Hash.new)
    end

    it 'always create new object' do
      a = container['hash']
      b = container['hash']

      expect(b).to eq(Hash.new)
      expect(b).to_not equal(a)
    end
  end
end
