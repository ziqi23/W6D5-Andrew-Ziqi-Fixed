# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = ['Red', 'Blue', 'Yellow', 'Black', 'White', 'Orange']
    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: COLORS }
    validates :sex, inclusion: { in: %w(m f) }
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date > Date.today
            self.errors.add(:base,"Not valid date")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end

    def self.get_color
        COLORS
    end
end
