class Crisis < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: {strict: true}

  def label
    name + " (#{country})"
  end
end
