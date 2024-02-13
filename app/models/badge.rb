class Badge < ApplicationRecord
    belongs_to :user, optional: true
    has_many :user_badges, dependent: :destroy
    has_many :users, through: :user_badges

    validates :title, :picture, :rule, :rule_params, presence: true


end
