class Server < ActiveRecord::Base
	has_many :groups, class_name: Servers::Group
	validates_presence_of :name, :region
end