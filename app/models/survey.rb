class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	validates :heading, presence: true,
                    length: { minimum: 5 }
    accepts_nested_attributes_for :questions
end
