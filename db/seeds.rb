# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if (r1 = Role.find_by_name('Администратор')).nil?
  r1 = Role.create!(name: 'Администратор', description: 'Полный доступ')
end

if (u1 = User.find_by_email('admin@localhost.ru')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty', email: 'admin@localhost.ru')
end

ru1 = RoleUser.create(role: r1, user: u1)
