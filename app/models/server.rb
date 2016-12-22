class Server < ActiveRecord::Base
	has_many :groups, class_name: Servers::Group
	belongs_to :source_server, class_name: Server, foreign_key: :source_server_id
	validates_presence_of :name, :region
end