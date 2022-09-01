require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS = %w(orange grey black purple blue).freeze
    validates :sex, inclusion: { in: %w(M F)},  presence: true #needs to be plural because it could be multiple columns that need verification
    validates :color, inclusion: {in: CAT_COLORS}, presence: true
    validate :birth_date_cannot_be_future #when validating a function it should be singular

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end

    def age
        now = Time.now.utc.to_date
        now.year - birth_date_year - ((now.monrh > birth_date.month || (now.month == birth_date && now.day >= birth_date.day)) ? 0 : 1)

    end
 
end
    