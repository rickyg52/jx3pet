module Api
  module V1
    module Groups
      module PetAliases
        class PetSerendipitiesController < Mjolnir::Api::ApiController
          
          before_action do
            group = Servers::Group.find_by_group_num(params[:group_id])
            if group
              @server = group.server 
              pet_alias = Pets::PetAlias.where(alias: params[:pet_alias_id], server: @server).first
              if pet_alias
                @pet = pet_alias.pet
              else
                @pet = Pet.find_by_name(params[:id])
              end
            end
          end

          def create
            if @server && @pet && params[:time] && params[:reporter]
              time = Time.at(params[:time].to_i)
              last_pet = Pets::PetSerendipity.where(server: @server, pet: @pet).last
              if last_pet.diff_between(time)[:hour] >= @pet.min_cd
                Pets::PetSerendipity.create(trigger_time: time, reporter: params[:reporter], pet: @pet, server: @server)
              else
                last_pet.trigger_time = time
                last_pet.save
              end
              head :ok
            else
              render status: 500, json: { errors: 'cannot save record' }
            end
          end
        end
      end
    end
  end
end
