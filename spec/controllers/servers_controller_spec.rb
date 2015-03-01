require 'rails_helper'

RSpec.describe ServersController, :type => :controller do

  let(:valid_attributes) {
    { ip: '127.0.0.1', user: user }
  }

  let(:invalid_attributes) {
    { ip: nil }
  }

  let(:valid_session) { {} }

  let(:user) { create(:user) }
  
  before { sign_in user }

  describe "GET index" do
    it "assigns all servers as @servers" do
      server = Server.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:servers)).to eq([server])
    end
  end

  describe "GET show" do
    it "assigns the requested server as @server" do
      server = Server.create! valid_attributes
      get :show, {:id => server.to_param}, valid_session
      expect(assigns(:server)).to eq(server)
    end
  end

  describe "GET new" do
    it "assigns a new server as @server" do
      get :new, {}, valid_session
      expect(assigns(:server)).to be_a_new(Server)
    end
  end

  describe "GET edit" do
    it "assigns the requested server as @server" do
      server = Server.create! valid_attributes
      get :edit, {:id => server.to_param}, valid_session
      expect(assigns(:server)).to eq(server)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Server" do
        expect {
          post :create, {:server => valid_attributes}, valid_session
        }.to change(Server, :count).by(1)
      end

      it "assigns a newly created server as @server" do
        post :create, {:server => valid_attributes}, valid_session
        expect(assigns(:server)).to be_a(Server)
        expect(assigns(:server)).to be_persisted
      end

      it "redirects to the created server" do
        post :create, {:server => valid_attributes}, valid_session
        expect(response).to redirect_to(servers_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved server as @server" do
        post :create, {:server => invalid_attributes}, valid_session
        expect(assigns(:server)).to be_a_new(Server)
      end

      it "re-renders the 'new' template" do
        post :create, {:server => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { 'ip' => '0.0.0.0' }
      }

      it "updates the requested server" do
        server = Server.create! valid_attributes
        put :update, {:id => server.to_param, :server => new_attributes}, valid_session
        server.reload
        expect(server.attributes).to include(new_attributes)
      end

      it "assigns the requested server as @server" do
        server = Server.create! valid_attributes
        put :update, {:id => server.to_param, :server => valid_attributes}, valid_session
        expect(assigns(:server)).to eq(server)
      end

      it "redirects to the server" do
        server = Server.create! valid_attributes
        put :update, {:id => server.to_param, :server => valid_attributes}, valid_session
        expect(response).to redirect_to(servers_path)
      end
    end

    describe "with invalid params" do
      it "assigns the server as @server" do
        server = Server.create! valid_attributes
        put :update, {:id => server.to_param, :server => invalid_attributes}, valid_session
        expect(assigns(:server)).to eq(server)
      end

      it "re-renders the 'edit' template" do
        server = Server.create! valid_attributes
        put :update, {:id => server.to_param, :server => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested server" do
      server = Server.create! valid_attributes
      expect {
        delete :destroy, {:id => server.to_param}, valid_session
      }.to change(Server, :count).by(-1)
    end

    it "redirects to the servers list" do
      server = Server.create! valid_attributes
      delete :destroy, {:id => server.to_param}, valid_session
      expect(response).to redirect_to(servers_url)
    end
  end
end
