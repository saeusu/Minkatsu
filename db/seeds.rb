# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

田中花子 = User.find_or_create_by!(email: "ohana@example.com") do |user|
  user.name = "田中花子"
  user.nickname = "ohana"
  user.password = "password"
end

山田令子 = User.find_or_create_by!(email: "yamasan@example.com") do |user|
  user.name = "山田令子"
  user.nickname = "やまさん"
  user.password = "password"
end

谷山太郎 = User.find_or_create_by!(email: "tanita@example.com") do |user|
  user.name = "谷山太郎"
  user.nickname = "たにー"
  user.password = "password"
end

genre = Genre.find_by(name: "収納") # ジャンル名で検索します
Post.find_or_create_by!(name: "コットンボックス") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.price = "690"
  post.body = "タオル収納として使っています。"
  post.user = 田中花子
  post.genre.name = genre if genre # ジャンルが見つかった場合のみ代入する
end

genre = Genre.find_by(name: "収納") # ジャンル名で検索します
Post.find_or_create_by!(name: "取っ手付きボックス") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.price = "2490"
  post.body = "取っ手があるので高いところでも取りやすいです。トイレで使ってます。"
  post.user = 山田令子
  post.genre.name = genre if genre # ジャンルが見つかった場合のみ代入する
end

genre = Genre.find_by(name: "収納") # ジャンル名で検索します
Post.find_or_create_by!(name: "トタンボックス") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.price = "1990"
  post.body = "靴磨きの道具をまとめて入れています。"
  post.user = 谷山太郎
  post.genre.name = genre if genre # ジャンルが見つかった場合のみ代入する
end

Genre.find_or_create_by!(name: "収納")
Genre.find_or_create_by!(name: "掃除")
Genre.find_or_create_by!(name: "キッチン")

Admin.find_or_create_by!(email: ENV['ADMIN_USEREMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end