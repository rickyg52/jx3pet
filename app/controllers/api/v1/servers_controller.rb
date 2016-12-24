module Api
  module V1
    # create jobs and return HTTP response
    class ServersController < Mjolnir::Api::ApiController
      include Concerns::Ping
      
      before_action only:[:show, :update] do
        @server = Server.find_by_id(params[:id])
      end

    	def create
    	end

      # return servers list
    	def index
        servers = []
        regions = []
        Server.all.each do |s|
          i = regions.index(s.region)
          unless i.nil?
            servers[i][:servers].push({ name: s.name, id: s.id })
          else
            servers.push({ region: s.region, servers: [{ name: s.name, id: s.id }]})
            regions.push(s.region)
          end
        end
        render json: servers.to_json
    	end

    	def update
    	end

      # return server status, source server
    	def show
        if server
          render json: represent_server(@server).to_json
        else
          render status: 404, json: { errors: 'server not found' }
        end
    	end

      def show_by_name
        server = Server.find_by_name(params[:name])
        if server
          render json: represent_server(server).to_json
        else
          render status: 404, json: { errors: 'server not found' }
        end
      end

      private 

      def represent_server(server)
        data = { 
          name: server.name, 
          id: server.id, 
          open: ping(server), 
        }
        data[:sourceServer] =  { 
              name: server.source_server.name, 
              id: server.source_server.id
        } if server.source_server
        data
      end
    end
  end
end