class CatRentalRequest < ApplicationRecord
validates :cat_id, :start_date, :end_date, :status, presence: true
validates :status, inclusion: { in: ["Pending","Approved","Denied"] }
before_save :set_default

belongs_to :cat,
primary_key: :id,
foreign_key: :cat_id,
class_name: :Cat

def overlapping_requests
  Cat.where(self.cat.start_date not between )


  protected
  def set_default
    self.status = "Pending" unless self.status
  end
end
