#coding: utf-8

require "csv"

CSV.foreach('db/shogo_first_list.csv') do |sf|
   ShogoFirst.create(:name => sf[0])
end

CSV.foreach('db/shogo_last_list.csv') do |sl|
   ShogoLast.create(:name => sl[0])
end

User.create!([
    { user_img: Rails.root.join("app/assets/images/user_img/1.jpg").open, username: "こうしくん1号", 
      password: "a", password_confirmation: "a" 
    },
    { user_img: Rails.root.join("app/assets/images/user_img/2.jpg").open, username: "こうしくん2号", 
      password: "b", password_confirmation: "b" 
    },
    { user_img: Rails.root.join("app/assets/images/user_img/3.jpg").open, username: "こうしくん3号", 
      password: "c", password_confirmation: "c" 
    },
    { user_img: Rails.root.join("app/assets/images/user_img/4.jpg").open, username: "こうしくん4号", 
      password: "d", password_confirmation: "d" 
    },
    { user_img: Rails.root.join("app/assets/images/user_img/5.jpg").open, username: "こうしくん5号", 
      password: "e", password_confirmation: "e" 
    }
])

Post.create(
   title: '葉っぱの肉巻き',
   body: "肉と野菜を切れ。野菜を肉で巻け。塩胡椒してレンジでチンだ。ポン酢をかけて食せ。",
   meshim: Rails.root.join("app/assets/images/sample/nikumaki.jpg").open,
   user_id: 1
 )

 Post.create(
    title: '肉キムチ',
    body: '肉を切れ。ごま油しいて肉を炒めろ。キムチを入れてさらに炒めて完成だ',
    meshim: Rails.root.join("app/assets/images/sample/butakimu.jpg").open,
    user_id: 2
  )

  Post.create(
    title: '肉トマト',
    body: '肉とトマトを切れ。肉を炒めろ。塩胡椒だ。トマトを入れてさらに炒めて完成だ。',
    meshim: Rails.root.join("app/assets/images/sample/nikutoma.jpg").open,
    user_id: 3
  )

  Post.create(
    title: '漢盛り野菜炒め',
    body: "野菜を切れ。肉を切れ。野菜を炒めろ。肉も炒めろ。塩胡椒だ。" ,
    meshim: Rails.root.join("app/assets/images/sample/meshi4.jpg").open,
    user_id: 4
  )

  Post.create(
    title: '通も唸る炒飯',
    body: '炒飯だ',
    meshim: Rails.root.join("app/assets/images/sample/meshi5.jpg").open,
    user_id: 5
  )
