# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({
    accountNumber: 1001,
    name: 'cesar',
    email: 'cesar@test.com',
    age: 29,
    phone: 3324533298,
    balance: 1000
});

5.times do |i|
    User.create({
        accountNumber: rand(1000..9999),
        name: "User #{i}",
        email: "user#{i}@test.com",
        age: rand(18..76),
        phone: rand(1000000000..9999999999),
        balance: 1000
    });
end