class Van < ApplicationRecord
  belongs_to :train
  belongs_to :van_kind

  validates :van_kind, presence: true
  validates :up_seats, presence: true
  validates :down_seats, presence: true
end
