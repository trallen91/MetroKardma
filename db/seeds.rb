Station.create(address: "3 Wall Street")
Station.create(address: "5 Bedford Street")

todd = User.create({email: "todd@gmail.com", username: "todd", picture: "me.jpg", password: "password"})

bill = User.create({email: "bill@gmail.com", username: "bill", picture: "bill.jpg", password: "password"})

henry = User.create(email: "henry@gmail.com", username: "henry", picture: "henry.jpg", password: "password")

KardmaExchange.create(giver: todd, receiver: bill, station: wall, complete: false)
