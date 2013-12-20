require 'spec_helper'

describe Order do
  let(:product) { create(:product, stock_level: 20) }
  let(:box) { create(:box) }
  let(:item_params) { {name: product.name, number: product.number, counter: product.stock_level} }

  it { should validate_presence_of(:box) }

  context "without items" do
    let(:order) { Order.new(box: box.id) }

    it "should create invalid order" do
      order.should be_invalid
    end

  end

  context "without box" do
    let(:order) { Order.new(items: [item_params]) }

    it "should create invalid order" do
      order.should be_invalid
    end

  end

  context "with box and items" do

    context "with correct item" do
      let(:order) { Order.new(box: box.id, items: [item_params]) }

      it "should create valid order" do
        order.should be_valid
      end

    end

    context "and item has big counter" do
      let(:order) { Order.new(box: box.id, items: [item_params.merge(counter: 50)]) }

      it "should create invalid order" do
        order.should be_invalid
        order.errors[:items].should include('Items are incorrect')
      end

    end

  end


  describe '#pack!' do
    let(:big_product) { create(:product, width: 10, height: 5, stock_level: 5) }
    let(:item_params) { {name: product.name, number: product.number, counter: 12} }
    let(:big_item_params) { {name: big_product.name, number: big_product.number, counter: 2} }
    let(:order) { Order.new(box: box.id, items: [item_params, big_item_params]) }
    before do
      order.pack!
    end

    it "should pack products to 2 parcels" do
      order.parcels.size.should == 2
      order.parcels.first.products.size.should == 10
      order.parcels.second.products.size.should == 2
      order.parcels.first.products.first.should == product
    end

    it "should move big product to unpacked_items" do
      order.unpacked_items.size.should == 1
      order.unpacked_items.first.product.should == big_product
    end

  end


end