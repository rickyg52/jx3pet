module Api
  module V1
    class GroupsController < Mjolnir::Api::ApiController
      
      before_action only:[:show, :update, :last_triggers, :all_in_cd, :all_aliases, :format] do
        @group = ::Servers::Group.find_by_group_num(params[:id])
      end

      # add new group, associate to server
    	def create
    	end

      # return group list
    	def index
        groups = []
        Servers::Group.all.each do |g|
          groups.push({ num: g.group_num, server: g.server.name })
        end
        render json: groups.to_json
    	end

    	def update
    	end

      # return server status, source server
    	def show
        if @group
          render json: representer(@group).to_json
        else
          render status: 404, json: { errors: 'group not found' }
        end
    	end

      def format
        if @group
          render json: { format: @group.report_format }
        else
          render status: 404, json: { errors: 'group not found' }
        end
      end

      def last_triggers
        if @group
          data = []
          Pets::PetSerendipity.where(server: @group.server).last(params[:count])
            .reverse
            .each { |serendipity| data.push(serendipity_representer(serendipity))}
          render json: data
        else
          render status: 404, json: { errors: 'group not found' }
        end
      end

      def all_in_cd
        if @group
          data = []
          @group.server.pet_serendipities.select('DISTINCT ON(pet_id) *').each do |serendipity| 
            diff_time = serendipity.diff_between(Time.now)
            pet = serendipity.pet
            if (diff_time[:hour] >= pet.min_cd && diff_time[:hour] <= pet.max_cd) or (diff_time[:hour] >= 2* pet.min_cd && diff_time[:hour] <= 2* pet.max_cd) 
              data.push(serendipity_representer(serendipity))
            end
          end
          render json: data
        else
          render status: 404, json: { errors: 'group not found' }
        end
      end

      def all_aliases
        if @group
          data = []
          @group.server.pet_aliases.each do |pet_alias| 
            data.push({ pet: pet_alias.pet.name, alias: pet_alias.alias })
          end
          render json: data
        else
          render status: 404, json: { errors: 'group not found' }
        end        
      end
      private 

      def representer(group)
        { 
          groupNum: group.group_num, 
          id: group.id, 
          server: group.server.name
        }
      end

      def serendipity_representer(serendipity)
        data = { 
          time: serendipity.trigger_time,
          timestamp: serendipity.trigger_time.to_i,
          reporter: serendipity.reporter,
          diff: serendipity.diff_between(Time.now)
        }
        pet_alias = @group.server.pet_aliases.where(pet: serendipity.pet).last
        if pet_alias
          data[:pet] = pet_alias.alias
        else
          data[:pet] = serendipity.pet.name
        end
        data
      end
    end
  end
end