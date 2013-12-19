class Item
  include ActiveModel::Model

  attr_accessor :name, :number, :counter, :product

  validates :number, presence: true
  validates :name, presence: true
  validates :counter, numericality: {greater_than: 0, only_integer: true}

  validate :number_validation
  validate :products_validation

  def blank?
    name.nil? && number.nil? && counter.nil?
  end

  def initialize(params={})
    super
    @counter = params[:counter].to_i
  end

  private

  def products_validation
    errors.add(:counter, I18n.t('errors.item.out_of_stock')) if product.present? && product.stock_level < counter
  end

  def number_validation
    errors.add(:name, I18n.t('errors.item.incorrect_name')) if number.blank?
  end

end