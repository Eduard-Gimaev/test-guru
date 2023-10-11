class TestPassage < ApplicationRecord

  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answers_count
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def success?
    correct_answers_count >= SUCCESS_RATIO
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end
  

  
  def next_question
    if current_question.nil? && test.present?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
