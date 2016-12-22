module Servers
	class Group < ActiveRecord::Base
		belongs_to :server

		validates_presence_of :server, :group_num
	end
end