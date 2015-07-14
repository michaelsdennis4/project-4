# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

User.destroy_all

User.create({
	first_name: 'Michael',
	last_name: 'Dennis',
	email: 'michaelsdennis4@gmail.com',
	password: 'juliank',
	password_confirmation: 'juliank',
	is_admin: "true"
})

User.create({
	first_name: 'Maria',
	last_name: 'Niforos',
	email: 'ariam7@gmail.com',
	password: 'pass',
	password_confirmation: 'pass',
	is_admin: "true"
})

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

Item.destroy_all

Item.create({code: 'Antique Lace # LA-225', caption: 'Majestic Brussels Lace Shawl w/ Point De Gaze Lace', description: 'A sumptious shawl! Splendid both in design and workmanship, with a elaborate design of flowing vines, leaves, and flowers. Superbly worked, large oval vignettes contain large three-dimensional roses, some measuring 4 1/2" across. The scale of the design is dramatic, this is the pinnacle of Brussels lace, truly museum quality. Measuring apprx. 123" by 38", 312 cm by almost 97 cm.'})

Item.create({code: 'Antique Lace # LA-219', caption: 'Exquisite Brussels Point De Gaze Lace w/ Cherubs', description: 'A rare and wonderful oval table center of Brussels Point De Gaze lace. A superb design with large ornate cherubs and doves, meandering vines and large three-dimensional roses. A gorgeous piece for the Brussels lace collector, superior in design and workmanship.'})

Item.create({code: 'Antique Lace # LA-71', caption: 'Rare & Exquisite Blonde Chantilly Lace Bedspread w/ Cherubs', description: 'A museum piece! The most exquisite hand-made blonde chantilly lace bedspread that I have ever seen. The lace was never really made into such large pieces so this must have been a special commission where money was simply not an issue. Large needlepoint cherubs with beautiful faces are worked at the top, with ornate vases and flowers throughout the bedspread.'})

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