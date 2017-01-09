module Api
  module V1
    module Servers
      # create jobs and return HTTP response
      class PetsController < Mjolnir::Api::ApiController
        before_action only: [:show] do
          @server = Server.find_by_id(params[:server_id])
          @pet_alias = Pets::PetAlias.where(alias: params[:id], server: @server).first if @server
          if @pet_alias
            @pet = @pet_alias.pet
          else
            @pet = Pet.find_by_name(params[:id])
          end
        end

        def show
          if @pet
            render json: { min: @pet.min_cd, max: @pet.max_cd }
          else
            render status: 404, json: { errors: 'server not found' }
          end
        end
      end
    end
 end
end
