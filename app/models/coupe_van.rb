class CoupeVan < Van
  validates :top_seats, :bottom_seats, presence: true
end
