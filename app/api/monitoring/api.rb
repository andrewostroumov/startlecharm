module Monitoring
  class API < Grape::API
    Unauthorized = Class.new(StandardError)

    rescue_from Unauthorized do |e|
      error_response status: 401, message: e.message
    end

    format :json
    prefix :api

    helpers do
      def snapshot_params
        return unless params[:snapshot]
        params[:snapshot].merge server_id: @server.id
      end

      def authenticate!
        @server = Server.authenticate headers['X-Server-Token']
        raise Monitoring::API::Unauthorized, 'Unauthorized' unless @server
      end
    end

    resource :snapshots do
      before { authenticate! }
      post do
        Snapshot.create(snapshot_params) if snapshot_params
      end
    end

    resource :server do
      before { authenticate! }
      get do
        @server
      end

      patch :update do
        @server.update_attributes params[:server]
      end
    end
  end
end
