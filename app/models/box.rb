class Box < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :volume, numericality: {greater_than: 0, less_than_or_equal_to: 2147483647, only_integer: true}

  def title
    "#{name} - [#{volume}]"
  end

end
