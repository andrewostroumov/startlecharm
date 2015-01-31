FactoryGirl.define do
  factory :log do
    mem_total  { Faker::Number.between(4.gigabyte/1.kilobyte, 8.gigabyte/1.kilobyte) }
    mem_free   { Faker::Number.between(0, 4.gigabyte/1.kilobyte) }
    swap_total { Faker::Number.between(4.gigabyte/1.kilobyte, 8.gigabyte/1.kilobyte) }
    swap_free  { Faker::Number.between(0, 4.gigabyte/1.kilobyte) }
    cpu_load   { Faker::Number.between(0, 100).to_f }
    cpu_temp   { Faker::Number.between(20, 150).to_f }
  end
end
