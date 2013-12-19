class Product < ActiveRecord::Base

  SEARCH_LIMIT = 10

  validates :number, presence: true, uniqueness: true, format: /\A[-a-z0-9]+\z/i, length: {maximum: 15}
  validates :name, presence: true, length: {maximum: 255}
  validates :width, :height, :depth, :weight,
            numericality: {greater_than: 0, less_than_or_equal_to: 2147483647, only_integer: true}
  validates :stock_level, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647,  only_integer: true}


  def to_param
    number
  end

  def title
    "#{name} - [#{stock_level}]"
  end

  def volume
    width * height * depth
  end


  class << self

    # Todo replace by fulltext search
    def search(query, exclude=[])
      products = where("name ILIKE ?", "%#{query}%").limit(SEARCH_LIMIT)
      products = products.where('number not in (?)', exclude) unless exclude.blank?
      products = products.where('stock_level > 0')
      products
    end

    def find_by_param(param)
      find_by_number(param) || raise(ActiveRecord::RecordNotFound)
    end

  end

end
