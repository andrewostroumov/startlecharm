class SnapshotsController < ApplicationController
  before_action :set_snapshots
  before_action :authenticate_user!
  before_action :respond_with_json, except: :index

  respond_to :json
  
  def index
    respond_with @snapshots
  end

  def cpu
  end

  def memory
  end

  def disks
  end

  private

  def respond_with_json
    respond_with @snapshots.to_json(only: action_name)
  end

  def set_snapshots
    @server = Server.find(params[:id])
    @snapshots = Snapshot.where(server_id: @server.id).desc(:id).limit(params[:limit])
  end
end
