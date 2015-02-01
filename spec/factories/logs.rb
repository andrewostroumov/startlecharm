FactoryGirl.define do
  factory :log do
    memory_total  { Faker::Number.between(4.gigabyte/1.kilobyte, 8.gigabyte/1.kilobyte) } # KB
    memory_free   { Faker::Number.between(0, 4.gigabyte/1.kilobyte) } # KB
    swap_total { Faker::Number.between(4.gigabyte/1.kilobyte, 8.gigabyte/1.kilobyte) } # KB
    swap_free  { Faker::Number.between(0, 4.gigabyte/1.kilobyte) } # KB
    cpu_load   { Faker::Number.between(1200, 2500) } # Mhz
    cpu_temp   { Faker::Number.between(20, 150).to_f } # Celsius/fahrenheit
  end
end
