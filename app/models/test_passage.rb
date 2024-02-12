class TestPassage < ApplicationRecord

  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_find_current_question, on: %i[create show update]

  scope :success, -> { where(success: true) }

  def choose_answer(answer_ids)
    @choosen_answers = answer_ids
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answers_count
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def current_question_number
    test.questions.index(current_question) + 1 if current_question.present?
  end

  def success?
    correct_answers_count >= SUCCESS_RATIO
  end

  def has_no_current_question?
    current_question.nil?
  end

  private

  def before_validation_find_current_question
    self.current_question = next_question
  end

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    if answer_ids.present?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      nil
    end
  end

  def next_question
    if current_question.nil? && test.present?
      test.questions.order(:id).first
    elsif @choosen_answers.nil?
      current_question
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

end
