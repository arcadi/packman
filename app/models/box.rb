class Box < ActiveRecord::Base

  validates :name, presence: true
  validates :stock_level, numericality: {greater_than_or_equal_to: 0, only_integer: true}

  def title
    "#{name} - [#{volume}]"
  end

end
