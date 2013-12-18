class Product < ActiveRecord::Base

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true
  validates_numericality_of :width, :height, :depth, :weight, greater_than: 0, only_integer: true
  validates_numericality_of :stock_level, greater_than_or_equal_to: 0, only_integer: true

  def to_param
    number
  end

  class << self

    def find_by_param(param)
      find_by_number(param) || raise(ActiveRecord::RecordNotFound)
    end

  end

end
