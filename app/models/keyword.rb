class Keyword < ActiveRecord::Base

	validates :phrase, presence: true

	has_and_belongs_to_many :items

end