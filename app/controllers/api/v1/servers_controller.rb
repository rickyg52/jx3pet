module Api
  module V1
    # create jobs and return HTTP response
    class ServersController < Mjolnir::Api::ApiController
      include PingHelper

      before_action only: [:show, :update, :last_triggers, :all_in_cd, :all_aliases] do
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
            servers[i][:servers].push(name: s.name, id: s.id)
          else
            servers.push(region: s.region, servers: [{ name: s.name, id: s.id }])
            regions.push(s.region)
          end
        end
        render json: servers.to_json
      end

      def update
      end

      # return server status, source server
      def show
        if @server
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

      def last_triggers
        if @server
          data = []
          Pets::PetSerendipity.where(server: @server).last(params[:count])
            .reverse.each { |serendipity| data.push(serendipity_representer(serendipity)) }
          render json: data
        else
          render status: 404, json: { errors: 'server not found' }
        end
      end

      def all_in_cd
        if @server
          data = []
          @server.pet_serendipities.select('DISTINCT ON(pet_id) *').order(:pet_id, trigger_time: :desc).each do |serendipity|
            diff_time = serendipity.diff_between(Time.now)
            pet = serendipity.pet
            if (diff_time[:hour] >= pet.min_cd && diff_time[:hour] <= pet.max_cd) || (diff_time[:hour] >= 2 * pet.min_cd && diff_time[:hour] <= 2 * pet.max_cd)
              data.push(serendipity_representer(serendipity))
            end
          end
          render json: data
        else
          render status: 404, json: { errors: 'server not found' }
        end
      end

      def all_aliases
        if @server
          data = []
          @server.pet_aliases.each do |pet_alias|
            data.push(pet: pet_alias.pet.name, alias: pet_alias.alias)
          end
          render json: data
        else
          render status: 404, json: { errors: 'server not found' }
        end
      end

      private

      def serendipity_representer(serendipity)
        data = {
          time: serendipity.trigger_time,
          timestamp: serendipity.trigger_time.to_i,
          reporter: serendipity.reporter,
          diff: serendipity.diff_between(Time.now)
        }
        pet_alias = @server.pet_aliases.where(pet: serendipity.pet).last
        if pet_alias
          data[:pet] = pet_alias.alias
        else
          data[:pet] = serendipity.pet.name
        end
        data
      end

      def represent_server(server)
        data = {
          name: server.name,
          id: server.id,
          open: s.source_server.nil? ? s.status : s.source_server.status
        }
        data[:sourceServer] = {
          name: server.source_server.name,
          id: server.source_server.id
        } if server.source_server
        data
      end
    end
  end
end
