# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  code           :string
#  caption        :string           not null
#  description    :string
#  purchase_price :integer
#  selling_price  :integer
#  is_available   :boolean          default(TRUE), not null
#  condition      :string
#  measurements   :string
#  date_acquired  :date
#  date_sold      :date
#  created_at     :datetime
#  updated_at     :datetime
#  thumb_image_id :integer
#

class Item < ActiveRecord::Base

	has_many :images

end
