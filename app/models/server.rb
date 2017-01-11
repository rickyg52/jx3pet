class Server < ActiveRecord::Base
  has_many :groups, class_name: Servers::Group
  has_many :pet_aliases, class_name: Pets::PetAlias
  has_many :pet_serendipities, class_name: Pets::PetSerendipity
  belongs_to :source_server, class_name: Server, foreign_key: :source_server_id
  validates_presence_of :name, :region

  def open?
    if source_server
      source_server.status
    else
      status
    end
  end
end
