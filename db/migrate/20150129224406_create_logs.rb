class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.column  :memory_total,       'integer unsigned'
      t.column  :memory_free,        'integer unsigned'
      t.column  :memory_available,   'integer unsigned'
      t.column  :swap_total,         'integer unsigned'
      t.column  :swap_free,          'integer unsigned'
      t.column  :cpu_load,           'integer unsigned'
      t.float   :cpu_temp

      t.timestamps null: false
    end
  end
end
