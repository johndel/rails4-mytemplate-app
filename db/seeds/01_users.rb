# Users
user = User.new(email: "istoselidas@gmail.com", password: "johndel12", password_confirmation: "johndel12", confirmed_at: Time.now)
user.save(validate: false) # password: 'john12' encrypted_password: "johndel12"