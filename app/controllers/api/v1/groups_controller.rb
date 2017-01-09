module Api
  module V1
    class GroupsController < Mjolnir::Api::ApiController
      before_action only: [:show, :update, :format] do
        @group = ::Servers::Group.find_by_group_num(params[:id])
      end

      # add new group, associate to server
      def create
      end

      # return group list
      def index
        groups = []
        ::Servers::Group.all.each do |g|
          groups.push(num: g.group_num, server: g.server.name, server_id: g.server.id, format: g.report_format, mark: g.mark)
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
          render json: { format: @group.report_format, mark: @group.mark }
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
    end
  end
end
