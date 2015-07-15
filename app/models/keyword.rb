# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  phrase     :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Keyword < ActiveRecord::Base

	validates :phrase, presence: true

	has_and_belongs_to_many :items

end
