class Cat < ApplicationRecord
  COLORS = ["blue","red","green","purple","orange","yellow","indigo","violet","black","brown","white"]
  validates :color, inclusion: { in: COLORS }
  validates :gender, inclusion: { in: ["M","F"] }
  validates :birth_date, :name, :gender, :color, presence: true

  has_many :rental_requests,
  dependent: :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest

  def age
    Time.now.year - self.birth_date.year
  end
end
