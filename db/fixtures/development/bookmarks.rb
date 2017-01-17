#seed_fu: rails db:seed_fu FILTER=bookmarks
topics = Topic.all

10.times do |count|
  Bookmark.create!(
    topic:   topics.sample,
    url:  "url_#{count}@com"
  )
end



puts "#{Bookmark.count} bookmarks created"
