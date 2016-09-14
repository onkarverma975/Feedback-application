class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  validates :body, presence: true,
                    length: { minimum: 1 }
end
