module Monitoring
  class API < Grape::API
    format :json
    prefix :api

    helpers do
      def authenticate!
      end
    end

    resource :logs do
      desc 'Return server history.'
      get do
        Log.all
      end

      desc 'Return log.'
      get ':id' do
        Log.find(params[:id])
      end


      desc 'Create log.'
      params do
        requires :log, type: Hash do
          requires :mem_total, :mem_free, :swap_total, :swap_free, type: Integer
          requires :cpu_load, :cpu_temp, type: Float
        end
      end
      post do
        Log.create!(declared(params)[:log])
      end
    end
  end
end
