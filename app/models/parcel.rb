class Parcel
  include ActiveModel::Model

  attr_accessor :box, :products
  delegate :volume, to: :box

  def initialize(box)
    @box = box
    @products = []
  end

  def free_volume
    volume - filled_volume
  end

  def add_product(product)
    if space_enough?(product)
      products << product
    end
  end

  def filled_volume
    products.reduce(0) { |sum, product| sum + product.volume }
  end


  def space_enough?(product)
    product.volume <= free_volume
  end


end