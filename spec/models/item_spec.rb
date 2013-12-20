require 'spec_helper'

describe Item do
  let(:product) { create(:product) }
  let(:item_params) { {name: product.name, number: product.number, counter: product.stock_level} }

  it "should return out of stock error" do
    item = Item.new(item_params.merge(counter: 10))
    item.should be_invalid
    item.errors[:counter].should include('Out of stock')
  end

  it "should return product not found error" do
    item = Item.new(item_params.merge(number: 'test'))
    item.should be_invalid
    item.errors[:name].should include('Product not found')
  end

  it "should return incorrect name error" do
    item = Item.new(item_params.merge(number: ''))
    item.should be_invalid
    item.errors[:name].should include('Incorrect name')
  end

  it "should create valid item" do
    item = Item.new(item_params)
    item.should be_valid
  end

end