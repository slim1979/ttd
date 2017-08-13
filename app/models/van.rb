class Van < ApplicationRecord
  belongs_to :train
  belongs_to :van_kind

  validates :van_kind, presence: true
end
