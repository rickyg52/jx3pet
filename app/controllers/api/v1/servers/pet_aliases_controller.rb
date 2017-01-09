module Api
  module V1
    module Servers
      class PetAliasesController < Mjolnir::Api::ApiController
        before_action do
          @server = Server.find_by_id(params[:server_id])
        end

        before_action only: [:previous_cd, :update, :status] do
          @pet_alias = Pets::PetAlias.where(alias: params[:id], server: @server).first if @server
          if @pet_alias
            @pet = @pet_alias.pet
          else
            @pet = Pet.find_by_name(params[:id])
          end
        end

        # add new group, associate to server
        def create
        end

        # return group list
        def index
          if @server
            data = []
            @server.pet_aliases.each do |p|
              data.push(representer(p))
            end
            render json: data.to_json
          else
            render status: 404, json: { errors: 'server not found' }
          end
        end

        def update
        end

        # get previous cds
        def previous_cd
          if @pet && @server
            data = []
            last_trigger = Time.now
            Pets::PetSerendipity.where(server: @server, pet: @pet).last(params[:count])
              .reverse
            _each do |serendipity|
              data.push(serendipity_representer(serendipity, last_trigger))
              last_trigger = serendipity.trigger_time
            end
            render json: data
          else
            render status: 404, json: { errors: 'pet alias not found' }
          end
        end

        def status
          if @pet && @server
            last_trigger = Pets::PetSerendipity.where(server: @server, pet: @pet).last
            data = {
              pet: @pet.name,
              lastTrigger: {
                time: last_trigger.trigger_time,
                timestamp: last_trigger.trigger_time.to_i
              },
              diff: last_trigger.diff_between(Time.now),
              status: last_trigger.in_cd?
            }
            render json: data
          else
            render status: 404, json: { errors: 'pet alias not found' }
          end
        end

        private

        def representer(pet_alias)
          {
            pAlias: pet_alias.alias,
            pet: pet_alias.pet.name
          }
        end

        def serendipity_representer(serendipity, last_trigger)
          {
            time: serendipity.trigger_time,
            timestamp: serendipity.trigger_time.to_i,
            reporter: serendipity.reporter,
            diff: serendipity.diff_between(last_trigger)
          }
        end
      end
    end
  end
end
