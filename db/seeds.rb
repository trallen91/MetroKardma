wall = Station.create(address: "3 Wall Street")
bedford = Station.create(address: "5 Bedford Street")
spring = Station.create(address: "2 Spring Street")


todd = User.create({email: "todd@gmail.com", password: "password"})

bill = User.create({email: "bill@gmail.com", password: "password"})

henry = User.create(email: "henry@gmail.com", password: "password")

jabroni = User.create(email: "henry@gmail.com", password: "password")

KardmaExchange.create(giver: todd, receiver: bill, station: wall, complete: false)

KardmaExchange.create(receiver: henry, station: bedford, complete: false)

KardmaExchange.create(giver: jabroni, station: spring, complete: false)
