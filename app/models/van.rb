class Van < ApplicationRecord
  belongs_to :train
  belongs_to :van_kind
  validates :kind, presence: true
end
