class Feedback < ApplicationRecord
    belongs_to :user

    validates :feedback, presence: true
end
