require 'spec_helper'

describe RBShop::Image do
  it 'should exist' do
    expect( described_class ).to eq(RBShop::Image)
  end

  context '.load' do
    it 'should load an image' do
      img = described_class.load fixture_path('octocat.jpeg')
      expect( img ).to be_a(described_class)
    end

    it 'should return nil for an invalid image' do
      img = described_class.load fixture_path('x-does-not-exist.jpg')
      expect( img ).to be_nil
    end
  end

  context 'getters' do
    let(:img) do
      described_class.load fixture_path('octocat.jpeg')
    end

    describe '#width' do
      it 'should have the correct value' do
        expect( img.width ).to eq(126)
      end
    end

    describe '#height' do
      it 'should have the correct value' do
        expect( img.height ).to eq(126)
      end
    end
  end

  context 'filters' do
    let(:img) do
      described_class.load fixture_path('octocat.jpeg')
    end
   
    describe '#charcoal' do
      it 'should work with no arguments' do
        expect( img.charcoal ).to be_a(described_class)
      end
    end
   
    describe '#charcoal' do
      it 'should work with one argument' do
        expect( img.charcoal 1.0 ).to be_a(described_class)
      end
    end
   
    describe '#charcoal' do
      it 'should require a float' do
        expect{ img.charcoal "10" }.to raise_error
      end
    end
  end

  context 'saving' do
    let(:filename) { 'octocat.jpeg' }
    let(:img) do
      described_class.load fixture_path(filename)
    end

    describe '#save' do
      it 'should save the image' do
        img.save('/tmp/imagetmp.jpeg')
        expect( File.exists?('/tmp/imagetmp.jpeg' ) ).to be_true
      end
    end
  end
end
