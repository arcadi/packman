class Product < ActiveRecord::Base

  SEARCH_LIMIT = 10

  validates :number, presence: true, uniqueness: true, format: /\A[-a-z0-9]+\z/i
  validates :name, presence: true
  validates :width, :height, :depth, :weight, numericality: {greater_than: 0, only_integer: true}
  validates :stock_level, numericality: {greater_than_or_equal_to: 0, only_integer: true}


  def to_param
    number
  end

  def title
    "#{name} - [#{stock_level}]"
  end


  class << self

    # Todo replace by fulltext search
    def search(query, exclude=[])
      products = where("name ILIKE ?", "%#{query}%").limit(SEARCH_LIMIT)
      products = products.where('number not in (?)', exclude) unless exclude.blank?
      products
    end

    def find_by_param(param)
      find_by_number(param) || raise(ActiveRecord::RecordNotFound)
    end

  end

end
