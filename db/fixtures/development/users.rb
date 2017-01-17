#seed_fu: rails db:seed_fu FILTER=users
10.times do |count|
  user = User.new(
      :email                 => "user#{count}@xxxxx.xxx",
      :name                  => "user#{count}",
      :password              => "123456",
      :password_confirmation => "123456"
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

puts "#{User.count} users created"
