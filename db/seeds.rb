# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

5.times do |no|
    User.create(
        username: "sample", 
        password: "a", 
        password_confirmation: "a"
    )
end

Post.create(
   title: '餃子餃子餃子餃子餃子餃子',
   body: '餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く',
   meshim: Rails.root.join("app/assets/images/sample/meshi1.jpg").open,
   user_id: 1
 )