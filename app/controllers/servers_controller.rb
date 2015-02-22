class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy, :activate]

  def index
    @servers = current_user.servers
  end

  def show
  end

  def new
    @server = Server.new
  end

  def edit
  end

  def create
    @server = Server.new(server_params.merge user: current_user)

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
    end
  end

  def activate
    client = XMLRPC::Client.new @server.ip, '/', 8080
    client.call 'system.activate', @server.authentication_token
    @server.activate!
    redirect_to @server
  end

  private
    def set_server
      @server = Server.find(params[:id])
    end

    def server_params
      params.require(:server).permit(:ip)
    end
end
