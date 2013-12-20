class Item
  include ActiveModel::Model

  attr_accessor :name, :number, :counter
  attr_writer :product

  validates :number, presence: true
  validates :name, presence: true
  validates :counter, numericality: {greater_than: 0, only_integer: true}

  validate :number_validation
  validate :products_validation

  def initialize(params={})
    super
    @counter = params[:counter].to_i
  end

  def product
    @product ||= Product.find_by_number(number) if number.present?
  end

  private

  def products_validation
    if product.present?
      errors.add(:counter, I18n.t('errors.item.out_of_stock')) if product.stock_level < counter
    else
      errors.add(:name, I18n.t('errors.item.not_found'))
    end
  end

  def number_validation
    errors.add(:name, I18n.t('errors.item.incorrect_name')) if number.blank?
  end

end