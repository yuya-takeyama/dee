describe Dee::Container do
  let(:container) { Dee::Container.new }

  describe '#[]' do
    it 'raises error when no defined key is specified' do
      expect { container['no_defined_key'] }.to raise_error
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
    context 'without argument' do
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

    context 'with an argument' do
      before do
        container.factory 'hash' do |value|
          {key: value}
        end
      end

      it 'creates object defined in factroy' do
        expect(container.create('hash', ['foo'])).to eq({key: 'foo'})
      end
    end

    context 'with multiple arguments' do
      before do
        container.factory 'hash' do |value1, value2|
          {key1: value1, key2: value2}
        end
      end

      it 'creates object defined in factroy' do
        expect(container.create('hash', ['foo', 'bar'])).to eq({key1: 'foo', key2: 'bar'})
      end
    end
  end
end
