class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.column :mem_total,  'integer unsigned', default: 0
      t.column :mem_free,   'integer unsigned', default: 0
      t.column :swap_total, 'integer unsigned', default: 0
      t.column :swap_free,  'integer unsigned', default: 0
      t.float :cpu_load, :cpu_temp, default: 0

      t.timestamps null: false
    end
  end
end
