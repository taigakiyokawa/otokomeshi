# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!([
    { username: "こうしくん1号", password: "a", password_confirmation: "a" },
    { username: "こうしくん2号", password: "b", password_confirmation: "b" },
    { username: "こうしくん3号", password: "c", password_confirmation: "c" },
    { username: "こうしくん4号", password: "d", password_confirmation: "d" },
    { username: "こうしくん5号", password: "e", password_confirmation: "e" }
])

Post.create(
   title: '完全無欠餃子',
   body: '餃子を焼く',
   meshim: Rails.root.join("app/assets/images/sample/meshi1.jpg").open,
   user_id: 1
 )

 Post.create(
    title: '美味カレー',
    body: 'カレーを煮込む',
    meshim: Rails.root.join("app/assets/images/sample/meshi2.jpg").open,
    user_id: 2
  )

  Post.create(
    title: 'クセになる牛丼',
    body: '吉●家に行く',
    meshim: Rails.root.join("app/assets/images/sample/meshi3.jpg").open,
    user_id: 3
  )

  Post.create(
    title: '漢盛り野菜炒め',
    body: '野菜を切れ。肉を切れ。野菜を炒めろ。肉も炒めろ。塩胡椒だ。' ,
    meshim: Rails.root.join("app/assets/images/sample/meshi4.jpg").open,
    user_id: 4
  )

  Post.create(
    title: '通も唸る炒飯',
    body: '炒飯だ',
    meshim: Rails.root.join("app/assets/images/sample/meshi5.jpg").open,
    user_id: 5
  )
