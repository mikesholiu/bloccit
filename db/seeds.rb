 require 'faker'
 
 # Create Posts
 5.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 post_contents = {title: "Unique title 10", body: "Unique body 20"}
 Post.create(post_contents) unless Post.where(post_contents).first

 posts = Post.all

 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

