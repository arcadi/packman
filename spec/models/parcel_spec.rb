require 'spec_helper'

describe Parcel do
  let(:product) { create(:product, width: 1, height: 2, depth: 2) }
  let(:big_product) { create(:product, width: 2, height: 2, depth: 3) }
  let(:box) { create(:box, volume: 8) }

  describe '#volume' do
    let(:parcel) { Parcel.new(box) }

    it "should return box volume" do
      parcel.volume.should == box.volume
    end

  end

  describe '#free_volume' do
    let(:parcel) { Parcel.new(box) }

    it "should return volume - product volume" do
      parcel.add_product(product)
      parcel.add_product(product)
      parcel.free_volume.should == box.volume - product.volume * 2
    end

  end

  describe '#filled_volume' do
    let(:parcel) { Parcel.new(box) }

    it "should return product volumes" do
      parcel.add_product(product)
      parcel.add_product(product)
      parcel.filled_volume.should == product.volume * 2
    end

  end

  describe '#add_product' do

    it "shouldn't add new product" do
      parcel  = Parcel.new(box)
      parcel.add_product(product)
      parcel.add_product(product)
      parcel.add_product(product)
      parcel.products.size.should == 2
    end

  end

  describe '#space_enough?' do

    it "should return not enough space for big product" do
      parcel  = Parcel.new(box)
      parcel.space_enough?(big_product).should be_false
    end

    it "should return not enough space new product" do
      parcel  = Parcel.new(box)
      parcel.add_product(product)
      parcel.add_product(product)
      parcel.space_enough?(product).should be_false
    end

    it "should return enough space new product" do
      parcel  = Parcel.new(box)
      parcel.add_product(product)
      parcel.space_enough?(product).should be_true
    end

  end


end