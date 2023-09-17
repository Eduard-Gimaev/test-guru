class Answer < ApplicationRecord
    belongs_to :question
    scope :correct, -> { where(correct: true)}

    validates :body, presence: true
    validates :validate_answers_count, on: :create

    def validate_answers_count
       errors.add(:base, "One Question can have from 1 to 4 answers.") if question.answers.count >= 4
    end
end
