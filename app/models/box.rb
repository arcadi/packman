class Box < ActiveRecord::Base

  validates :name, presence: true
  validates_numericality_of :volume, greater_than: 0, only_integer: true

end
