class Blacklist < ActiveRecord::Base
	belongs_to :pet_alias

	validates_presence_of :qq_num
end