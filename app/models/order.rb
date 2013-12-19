class Order
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :box, :items, :parcels

  validates :box, :items, presence: true

  validate :items_validation
  validate :box_validation

  def initialize(params={})
    @box = params[:box]
    @items = parse_items(params[:items]) || [Item.new]
  end

  def pack!
    @parcels = pack_parcels
  end

  private

  def box_validation
    errors.add(:box, I18n.t('errors.order.box_not_found')) if Box.find_by_id(box).blank?
  end

  def items_validation
    unless items.map { |item| item.valid? }.all? { |item| item }
      errors.add(:items, I18n.t('errors.order.incorrect_items'))
    end
  end

  def pack_parcels
    parcels = []
    items.each do |item|

    end
    parcel = Parcel.new
    parcels
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
