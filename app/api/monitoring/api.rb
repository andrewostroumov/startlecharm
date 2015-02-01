module Monitoring
  class API < Grape::API
    format :json
    prefix :api

    helpers do
      def log_params
        params[:log]
      end
    end

    resource :logs do
      desc 'Create log.'
      post do
        Log.create!(log_params.deep_join_keys)
      end
    end
  end
end
