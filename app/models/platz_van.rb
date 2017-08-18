class PlatzVan < Van
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
end
