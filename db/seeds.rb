# coding: utf-8

require "csv"

CSV.foreach('db/user.csv') do |us|
    User.create(
        username: us[0], 
        user_img: Rails.root.join(us[1]).open,
        password: "a")
 end

 CSV.foreach('db/post.csv') do |ps|
    Post.create(
        title: ps[0],
        meshim: Rails.root.join(ps[1]).open,
        body: ps[2],
        user_id: ps[3])
 end

 CSV.foreach('db/like.csv') do |lk|
    Like.create(
        post_id: lk[0],
        user_id: lk[1]
    )
 end

CSV.foreach('db/shogo_first_list.csv') do |sf|
   ShogoFirst.create(name: sf[0])
end

CSV.foreach('db/shogo_last_list.csv') do |sl|
   ShogoLast.create(name: sl[0])
end
