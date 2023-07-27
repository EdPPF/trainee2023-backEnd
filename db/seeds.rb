# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email:'edppf@email.com', name:'EdPPF', password:'abc123', is_admin:true)
User.find_by(email: 'edppf@email.com').images.attach(io: File.open('./public/github-mark.png'), filename:('github-mark.png'))
User.find_by(email: 'edppf@email.com').images.attach(io: File.open('./public/github-mark-white.png'), filename:('github-mark-white.png'))

Post.create(title:'How to 2', content:'afoaekfm', user_id:1)
Post.find_by(title: 'How to 2').images.attach(io: File.open('./public/github-mark.png'), filename:('github-mark.png'))
Post.find_by(title: 'How to 2').images.attach(io: File.open('./public/github-mark-white.png'), filename:('github-mark-white.png'))
