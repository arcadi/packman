require 'spec_helper'

describe Product do
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:width).only_integer }
  it { should validate_numericality_of(:height).only_integer }
  it { should validate_numericality_of(:depth).only_integer }
  it { should validate_numericality_of(:weight).only_integer }
  it { should validate_numericality_of(:stock_level).only_integer }


  describe '#tile' do

    it 'should contain name' do
      product = build(:product)
      product.title.should_not be_empty
      product.title.should include(product.name)
    end

  end

  describe '#volume' do

    it 'should return product volume' do
      product = build(:product, width: 1, height: 2, depth: 3)
      product.volume.should == 1*2*3
    end

  end

  describe '#to_param' do

    it 'should be equal number' do
      product = build(:product)
      product.to_param.should == product.number
    end

  end


  describe '.search' do
    let!(:product) { create(:product, name: 'first') }
    let!(:product_second) { create(:product, name: 'first again') }
    let!(:product_third) { create(:product, name: 'second') }

    it 'should search product by name' do
      products = Product.search(product.name)
      products.size.should == 2
      products.first.name.should include(product.name)
      products.second.name.should include(product.name)
    end

    it 'should search product by name and exclude by number' do
      products = Product.search(product.name, [product_second.number])
      products.size.should == 1
      products.first.should == product
    end

  end


  describe '.find_by_param' do

    it 'should find product by number' do
      product = create(:product)
      Product.find_by_param(product.number).should == product
    end

  end

end
