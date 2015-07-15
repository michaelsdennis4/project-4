# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  is_admin        :string           default("false"), not null
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  is_active       :boolean          default(TRUE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :is_active, presence: true

	has_secure_password

end
