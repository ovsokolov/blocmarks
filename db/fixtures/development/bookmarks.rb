#seed_fu: rails db:seed_fu FILTER=bookmarks
topics = Topic.all
users = User.all

10.times do |count|
  Bookmark.create!(
    topic:   topics.sample,
    user: users.sample,
    url:  "url_#{count}@com"
  )
end



puts "#{Bookmark.count} bookmarks created"
