class Movie < ActiveRecord::Base

	belongs_to :user
	attr_accessor :length_hour, :length_min

	validates_presence_of :title
	validates_presence_of :format
	validates_presence_of :length
	validates_presence_of :release_year
	# validates_presence_of :rating
	validates_length_of :title, maximum: 30, :message => "less than 50 charaters"
	validates_inclusion_of :format, in: %w( VHD DVD String ), :message => "extension %{value} is not included in the list"
	validates_numericality_of :release_year, :greater_than => 1800, :less_than => 2100, :message => "must be in range 1800~2100"
	validates_numericality_of :length, greater_than: 0, less_than: 500, :message => "must be in range 0~500 minutes"

	before_validation do
		self.length = (@length_hour.to_i*60+@length_min.to_i)
	end
end
