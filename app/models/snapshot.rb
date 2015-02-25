class Snapshot
  include Mongoid::Document
  # include Mongoid::Attributes::Dynamic
  field :server_id, type: Integer
  field :memory, type: Hash
  field :cpu, type: Hash
  field :disks, type: Array
end