# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  url        :string           not null
#  caption    :string
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base

	belongs_to :item

end
