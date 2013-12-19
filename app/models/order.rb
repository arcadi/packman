class Order
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :box, :items
  attr_reader :parcels, :unpacked_items, :box_model

  validates :box, :items, presence: true
  validate :items_validation
  validate :box_validation

  def initialize(params={})
    @box = params[:box]
    @box_model = Box.find_by_id(@box)
    @items = parse_items(params[:items]) || [Item.new]
  end

  def pack!
    @parcels = []
    @unpacked_items = []
    pack_parcels
  end

  private

  def box_validation
    errors.add(:box, I18n.t('errors.order.box_not_found')) if box_model.blank?
  end

  def items_validation
    unless items.map { |item| item.valid? }.all? { |item| item }
      errors.add(:items, I18n.t('errors.order.incorrect_items'))
    end
  end

  def pack_parcels
    items.each do |item|
      if cannot_be_packed?(item)
        @unpacked_items << item
      else
        item.counter.times do
          add_parcel(item) unless add_product_to_parcels(item)
        end
      end
    end
  end

  def cannot_be_packed?(item)
    item.product.volume > box_model.volume
  end

  def add_product_to_parcels(item)
    @parcels.each do |parcel|
      return true if parcel.add_product(item.product)
    end
    false
  end

  def add_parcel(item=nil)
    parcel = Parcel.new(box_model)
    parcel.add_product(item.product) if item
    @parcels.push(parcel)
  end

  def parse_items(items_params=[])
    load_products(group_items(items_params.map { |item| Item.new(item) })) unless items_params.blank?
  end

  def group_items(items)
    items.group_by { |a| a.number }.map do |number, group|
      unless number.blank?
        Item.new({
                   number: number,
                   counter: group.reduce(0) { |sum, item| sum + item.counter },
                   name: group.first.name
                 })
      else
        group
      end
    end.flatten
  end

  def load_products(items)
    products = Product.where(number: items.map(&:number).select { |a| a.present? })
    items.each do |item|
      item.product = products.find { |product| product.number == item.number }
      item.name = item.product.title if item.product
    end
  end

end
