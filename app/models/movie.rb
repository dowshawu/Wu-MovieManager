class Movie < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :title
	validates_presence_of :format
	validates_presence_of :length
	validates_presence_of :release_year
	# validates_presence_of :rating
end
