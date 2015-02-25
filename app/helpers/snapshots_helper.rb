module SnapshotsHelper
  def disk_stats(disk)
    "#{number_to_human_size disk['used'] * 1024 }/#{ number_to_human_size disk['total'] * 1024 }"
  end
end