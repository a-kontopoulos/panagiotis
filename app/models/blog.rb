class Blog < ApplicationRecord

  paginates_per 6

  has_one_attached :image

  #returns the most recent blogs and limits the results to 6
  scope :most_recent,          -> { order(updated_at: :desc).limit(6) }

end
