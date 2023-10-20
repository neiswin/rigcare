# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Rig.create rig_type: "АРС-250"
# Rig.create rig_type: "Drillmec наземный"
# Rig.create rig_type: "Drillmec эшелон"



# Tag.destroy_all
# tags = [
# "Буровая лебёдка",
# "Буровой насос ",
# "Ротор",
# "Кабина бурильщика", 
# "Пневмостанция",
# "Дизельный генератор",
# "Система охлаждения",
# "ГСУ тормозов лебёдки",
# "Подпорный насос",
# "ОЦС"
# ]


# tags.each do |item|
#   Tag.create title: item
# end

10.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 112131, # Установите желаемый пароль
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    department: rand(1..3),
    position: rand(1..5),
    phone: Faker::PhoneNumber.phone_number,
    role: 0 # Установите желаемую роль
  )
  user.save
end


20.times do
  faq = Faq.new(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user_id: User.all.sample.id, # Выбираем случайного пользователя
    rig_id: Rig.all.sample.id,    # Выбираем случайную машину
  )
  faq.save
end