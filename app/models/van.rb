class Van < ApplicationRecord
  validates :kind, presence: true
  belongs_to :train
end
