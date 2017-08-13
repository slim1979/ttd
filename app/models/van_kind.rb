class VanKind < ApplicationRecord
  has_many :vans

  validates :title, presence: true
end
