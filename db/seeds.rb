user = User.create email: Faker::Internet.email, password: Faker::Internet.password
server = user.servers.create distro_name: 'Arch Linux', kernel_release: `uname --kernel-release`
puts "Test Authentication Token: #{server.authentication_token}"
