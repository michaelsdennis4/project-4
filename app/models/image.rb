# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  image_uid  :string
#  caption    :string
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base

	belongs_to :item

	extend Dragonfly::Model
		dragonfly_accessor :image

end
