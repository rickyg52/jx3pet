module Api
  module V1
  	#
    class SerendipitiesController < Mjolnir::Api::ApiController
      def index
        data = []
        Serendipity.all.each do |s|
          data.push(name: s.name, cd: s.cd)
        end
        render json: data.to_json
      end

      def show
        data = { }
        s = Serendipity.find_by_name(params[:id])
        data[:cd] =  s.cd  if s
        if params[:server_id]
          server = Server.find(params[:server_id])
          data[:region] = server.region if server
          data[:server] = server.source_server ? server.source_server.name : server.name
        end
        render json: data.to_json
      end
    end
  end
end