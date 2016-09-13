class Question < ActiveRecord::Base

  ANSWER_TYPES = %w(Boolean Scale)

  belongs_to :survey
  belongs_to :question_group

  validates :survey, presence: true
  validates :question_group, presence: true
  validates :answer_type, presence: true, :inclusion => { :in => ANSWER_TYPES }

end
