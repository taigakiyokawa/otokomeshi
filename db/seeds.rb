# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# Post.create(
#   title: '餃子餃子餃子餃子餃子餃子',
#   body: '餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く餃子を焼く',
#   meshim: open("/app/assets/images/sample/meshi1.jpg"),
#   user_id: 1
# )

 require "csv"

 CSV.foreach('db/shogo_first_list.csv') do |sf|
    ShogoFirst.create(:name => sf[0])
 end

 CSV.foreach('db/shogo_last_list.csv') do |sl|
    ShogoLast.create(:name => sl[0])
 end