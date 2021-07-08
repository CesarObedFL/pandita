User.create({ accountNumber: 1001, name: 'cesar', email: 'cesar@test.com', age: 29, phone: 3324533298, balance: 0 });
Movement.create({ user_id: 1, operation: 'deposit', destinationAccount: "", amount: 1000 });

5.times do |i|
    User.create({
        accountNumber: rand(1000..9999),
        name: "User #{i + 2}",
        email: "user#{i + 2}@test.com",
        age: rand(18..76),
        phone: rand(1000000000..9999999999),
        balance: 0
    });

    Movement.create({
        user_id: "#{i + 2}",
        operation: "deposit",
        destinationAccount: "",
        amount: 1000
    });
end