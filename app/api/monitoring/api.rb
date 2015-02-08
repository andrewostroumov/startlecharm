module Monitoring
  class API < Grape::API
    Unauthorized = Class.new(StandardError)

    rescue_from Unauthorized do |e|
      error_response status: 401, message: e.message
    end

    format :json
    prefix :api

    helpers do
      def log_params
        params[:log]
      end

      def authenticate!
        @server = Server.authenticate headers['X-Server-Token']
        raise Monitoring::API::Unauthorized, 'Unauthorized' unless @server
      end
    end

    resource :logs do
      before { authenticate! }
      post do
        @server.logs.create!(log_params.deep_join) if log_params
      end
    end
  end
end
