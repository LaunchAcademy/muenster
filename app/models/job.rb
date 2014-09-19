class Job < ActiveRecord::Base
  belongs_to :company

  validates :title, presence: true
  validates :company, presence: true
  validates :description, length: { maximum: 5000 }

  def self.search(query)
    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end
end
