class Answer < ApplicationRecord
  
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  def validate_answers_count
    errors.add(:base, 'Exceeded the number of answers') if question.answers.count >= 4
  end
end
