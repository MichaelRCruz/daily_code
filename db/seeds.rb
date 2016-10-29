# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { :name => 'Michael', :email => 'michael@michael.com', :password_digest => '1234', :admin => true },
  { :name => 'Emily', :email => 'emily@emily.com', :password_digest => '1234', :admin => false }
  ])

posts = Post.create([
  { :title => 'Michael Blog Title', :snippet => 'script.js', :language => 'javascript', :content => 'This was my thought process.' },
  { :title => 'Emily Blog Title', :snippet => 'ruby.rb', :language => 'ruby', :content => 'How should I refactor' }
  ])

comments = Comment.create([
  { :content => 'Cool idea!' },
  { :content => 'Refactor with gusto!' }
  ])
