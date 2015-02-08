class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :distro_name
      t.string :kernel_release
      t.integer :uptime
      t.string :ip
      t.string :authentication_token
      t.references :user

      t.timestamps null: false
    end
    add_index :servers, :authentication_token, unique: true
  end
end
