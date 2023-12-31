# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Rig.create rig_type: "АРС-225"
# Rig.create rig_type: "Уралмаш 3Д-76/86"
# Rig.create rig_type: "ДЭЛ-150"
# Rig.create rig_type: "Drillmec наземный"
# Rig.create rig_type: "Drillmec эшелон"
# Rig.create rig_type: "Общие"


Tag.destroy_all

tags = {
  tag_device: ["Датчик давления", "Датчик уровня", "Датчик температуры", "Датчик расхода",
                "Датчик положения", "Энкодер", "Клапан", "Модуль дискретных входов",
                "Модуль дискретных выходов", "Модуль аналоговых входов", "Модуль аналоговых выходов",
                "Модуль CPU", "Сетевое оборудование", "Блок питания", "Реле", "Автоматический выключатель",
                "Джойстик", "Потенциометр", "Индикатор", "Манометр"],

  tag_place: ["Буровая лебёдка", "Буровой насос", "Буровая лебёдка 1", "Буровой насос 1",
              "Буровой насос 2", "Ротор", "Кабина бурильщика", "Пневмостанция",
              "Дизельный генератор", "Система охлаждения", "ГСУ тормозов лебёдки",
              "Подпорный насос", "Буровая площадка", "Вибрационный узел",
              "Смешивательный резервуар", "Запасной резервуар", "Водный резервуар",
              "Откачивающий резервуар", "Промежуточный резервуар", "Буровая вышка",
              "Контейнер MCC", "Контейнер VFD", "Трансформаторный контейнер №1",
              "Трансформаторный контейнер №2", "Насосная", "ОЦС"],

  tag_doc: ["Инструкция", "Руководство", "Инструкция", "Руководство", "Акт",
            "Заявка на закупку", "Схема"]
}

tags.each_pair do |key, values|
  values.each do |value|
    Tag.create(title: value, tag_type: key.to_s)
  end
end




# 10.times do
#   user = User.new(
#     email: Faker::Internet.unique.email,
#     password: 112131, # Установите желаемый пароль
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     department: rand(1..3),
#     position: rand(1..5),
#     phone: Faker::PhoneNumber.phone_number,
#     role: 0 # Установите желаемую роль
#   )
#   user.save
# end


# 20.times do
#   faq = Faq.new(
#     title: Faker::Lorem.sentence,
#     body: Faker::Lorem.paragraph,
#     user_id: User.all.sample.id, # Выбираем случайного пользователя
#     rig_id: Rig.all.sample.id,    # Выбираем случайную машину
#   )
#   faq.save
# end


# 20.times do
#   t = Test.new(
#     name: Faker::Lorem.sentence,
#     text: Faker::Lorem.paragraph,
#   )
#   t.save
# end