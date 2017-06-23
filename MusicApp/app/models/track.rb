class Track < ApplicationRecord
  validates :album_id, :title, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
end
