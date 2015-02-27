class SnapshotsController < ApplicationController
  before_action :set_snapshots
  before_action :authenticate_user!
  
  respond_to :json
  
  def index
    respond_with @snapshots
  end

  def cpu
    respond_with @snapshots.to_json(only: :cpu)
  end

  def memory
    respond_with @snapshots.to_json(only: :memory)
  end

  def disks
    respond_with @snapshots.to_json(only: :disks)
  end

  private

  def set_snapshots
    @server = Server.find(params[:id])
    @snapshots = Snapshot.where(server_id: @server.id).desc(:id).limit(params[:limit])
  end
end
