class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates :artwork_id, uniqueness: {scope: :viewer_id}

  # has_many :shared_viewers,
  #   primary_key: :id,
  #   foreign_key: :viewer_id,
  #   class_name: :User

  belongs_to :shared_viewers,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User
end
