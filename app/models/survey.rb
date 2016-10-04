class Survey < ActiveRecord::Base
  
  has_many :questions, -> { order(number: :asc) }
  accepts_nested_attributes_for :questions

  belongs_to :user
  validates :user, presence: {strict: true}
  
end
