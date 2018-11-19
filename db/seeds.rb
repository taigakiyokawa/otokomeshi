#coding: utf-8

require "csv"

CSV.foreach('db/shogo_first_list.csv') do |sf|
   ShogoFirst.create(:name => sf[0])
end

CSV.foreach('db/shogo_last_list.csv') do |sl|
   ShogoLast.create(:name => sl[0])
end