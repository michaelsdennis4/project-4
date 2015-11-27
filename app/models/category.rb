# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  sequence   :integer
#

class Category < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true

	has_and_belongs_to_many :items

end
