# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Create 10 users, 100 posts, 300 comments, and 500 votes"

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 12345678
  )
end


users = User.all

100.times do 
  Post.create(
    title: Faker::Lorem.paragraph(sentence_count: 1),
    link_url: Faker::Internet.url,
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user_id: users.sample.id
  )
end

posts = Post.all

50.times do 
  comment_l1 = Comment.create(
    user_id: users.sample.id,
    post_id: posts.sample.id,
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
  5.times do
    Comment.create(
      user_id: comment_l1.user_id,
      post_id: comment_l1.post_id,
      parent_id: comment_l1.id,
      content: Faker::Lorem.paragraph(sentence_count: 2)
    )  
  end
end

50.times do 
  Comment.create(
    user_id: users.sample.id,
    post_id: posts.sample.id,
    content: Faker::Lorem.paragraph(sentence_count: 2)
  )
end


500.times do
  Vote.find_or_create_by(
    user_id: users.sample.id, 
    post_id: posts.sample.id
  )
end

CalculateScoreService.new.execute

puts "Done!"
