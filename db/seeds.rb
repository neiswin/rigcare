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




tags = [
"Буровая лебёдка",
"Буровой насос ",
"Ротор",
"Кабина бурильщика", 
"Пневмостанция",
"Дизельный генератор",
"Система охлаждения",
"ГСУ тормозов лебёдки",
"Подпорный насос",
"ОЦС"
]


tags.each do |item|
  Tag.create title: item
end