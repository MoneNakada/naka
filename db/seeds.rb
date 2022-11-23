# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'a@a',
   password: 'aaaaaa'
)

Genre.create!(
   name: 'ケーキ',
   is_active: true
)

item = Item.create!(
   genre_id: 1,
   name: 'ショートケーキ',
   introduction: '1番目の商品です。',
   price: 500,
   is_active: true
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/cake1.jpg')), filename: 'cake1.jpg')

Customer.create!(
   first_name: "難波",
   last_name: "専太",
   first_name_kana: "ナンバ",
   last_name_kana: "センタ",
   email: "0@0",
   postal_code: "5420076",
   address: "大阪府大阪市中央区難波4-4-4 難波御堂筋センタービル 8階",
   telephone_number: "00088889999",
   is_active: true,
   password: "000000",
)