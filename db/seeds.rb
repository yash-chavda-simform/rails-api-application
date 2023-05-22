# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do
  article = Article.create(title: Faker::Book.title, body: Faker::Lorem.sentence, release_date: "02/03/2023")
  comment = article.comments.create(comment: Faker::Lorem.sentence, date_of_comment: Time.now)
end
