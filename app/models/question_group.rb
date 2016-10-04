class QuestionGroup < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: {strict: true}
end
