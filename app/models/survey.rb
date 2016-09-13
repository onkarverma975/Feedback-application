class Survey < ApplicationRecord
	validates :heading, presence: true, length: {minimum:5}
end