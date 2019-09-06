class Task < ApplicationRecord
    belongs_to :user

    validates :duration, presence: true
    validates :performed_on, presence: true
    validates :duration, numericality: true
end
