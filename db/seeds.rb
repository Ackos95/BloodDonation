# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!({ first_name: 'Admin', last_name: 'Bd', email: 'admin@bd.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: true, birth_date: Date.new(1995, 12, 18) })
roles = Role.create!([{ name: Role::ADMIN }, { name: Role::DONOR }])
admin.roles << roles[0]

users = User.create!([
  { first_name: 'Donor1', last_name: 'Donor', email: 'donor1@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: true, birth_date: Date.new(1995, 12, 18) },
  { first_name: 'Donor2', last_name: 'Donor', email: 'donor2@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_B, rh: true, birth_date: Date.new(1990, 12, 18) },
  { first_name: 'Donor3', last_name: 'Donor', email: 'donor3@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: true, birth_date: Date.new(1997, 12, 18) },
  { first_name: 'Donor4', last_name: 'Donor', email: 'donor4@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_AB, rh: true, birth_date: Date.new(1996, 12, 18) },
  { first_name: 'Donor5', last_name: 'Donor', email: 'donor5@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: false, birth_date: Date.new(1995, 12, 18) },
  { first_name: 'Donor6', last_name: 'Donor', email: 'donor6@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: true, birth_date: Date.new(1995, 12, 18) },
  { first_name: 'Donor7', last_name: 'Donor', email: 'donor7@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: false, birth_date: Date.new(1994, 12, 18) },
  { first_name: 'Donor8', last_name: 'Donor', email: 'donor8@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_B, rh: true, birth_date: Date.new(1980, 12, 18) },
  { first_name: 'Donor9', last_name: 'Donor', email: 'donor9@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: true, birth_date: Date.new(1985, 12, 18) },
  { first_name: 'Donor10', last_name: 'Donor', email: 'donor10@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: false, birth_date: Date.new(1987, 12, 18) },
  { first_name: 'Donor11', last_name: 'Donor', email: 'donor11@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_AB, rh: true, birth_date: Date.new(1975, 12, 18) },
  { first_name: 'Donor12', last_name: 'Donor', email: 'donor12@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_AB, rh: true, birth_date: Date.new(1965, 12, 18) },
  { first_name: 'Donor13', last_name: 'Donor', email: 'donor13@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_AB, rh: false, birth_date: Date.new(1977, 12, 18) },
  { first_name: 'Donor14', last_name: 'Donor', email: 'donor14@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_B, rh: true, birth_date: Date.new(1988, 12, 18) },
  { first_name: 'Donor15', last_name: 'Donor', email: 'donor15@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: true, birth_date: Date.new(1988, 12, 18) },
  { first_name: 'Donor16', last_name: 'Donor', email: 'donor16@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: true, birth_date: Date.new(1972, 12, 18) },
  { first_name: 'Donor17', last_name: 'Donor', email: 'donor17@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: false, birth_date: Date.new(1977, 12, 18) },
  { first_name: 'Donor18', last_name: 'Donor', email: 'donor18@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_B, rh: true, birth_date: Date.new(1999, 12, 18) },
  { first_name: 'Donor19', last_name: 'Donor', email: 'donor19@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: false, birth_date: Date.new(1945, 12, 18) },
  { first_name: 'Donor20', last_name: 'Donor', email: 'donor20@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: true, birth_date: Date.new(1956, 12, 18) },
  { first_name: 'Donor21', last_name: 'Donor', email: 'donor21@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_Z, rh: false, birth_date: Date.new(1957, 12, 18) },
  { first_name: 'Donor22', last_name: 'Donor', email: 'donor22@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: false, birth_date: Date.new(1977, 12, 18) },
  { first_name: 'Donor23', last_name: 'Donor', email: 'donor23@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: false, birth_date: Date.new(1988, 12, 18) },
  { first_name: 'Donor24', last_name: 'Donor', email: 'donor24@test.com', password: 'password', password_confirmation: 'password', blood_type: User::BLOOD_TYPE_A, rh: true, birth_date: Date.new(1995, 12, 18) },
])

users.each do |user|
  user.roles << roles[1]
end

donations = Donation.create!([
  { timestamp: DateTime.new(2017, 8, 10, 14, 0, 0), user: users[0] },
  { timestamp: DateTime.new(2017, 9, 10, 14, 0, 0), user: users[0] },
  { timestamp: DateTime.new(2017, 8, 10, 15, 0, 0), user: users[1] },
  { timestamp: DateTime.new(2017, 8, 10, 14, 15, 0), user: users[2] },
  { timestamp: DateTime.new(2017, 7, 10, 10, 0, 0), user: users[0] }
])