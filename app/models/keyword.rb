# == Schema Information
#
# Table name: keywords
#
#  id         :integer          not null, primary key
#  phrase     :string           not null
#  created_at :datetime
#  updated_at :datetime
#  sequence   :integer
#

class Keyword < ActiveRecord::Base

	validates :phrase, presence: true, uniqueness: true

	has_and_belongs_to_many :items

end
