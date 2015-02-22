class AddStateToServers < ActiveRecord::Migration
  def change
    add_column :servers, :state, :string
  end
end
