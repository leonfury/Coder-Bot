# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Midpoint.delete_all
Codelang.delete_all

User.create(
    username: 'user1',
    first_name: 'user',
    last_name: 'one',
    email: 'user1@mail.com',
    password: "123",
    address: 'Desa Kiara Condominium',
    longtitude: 101.63043,
    latitude: 3.133894,
)

User.create(
    username: 'user2',
    first_name: 'user',
    last_name: 'two',
    email: 'user2@mail.com',
    password: "123",
    address: 'PV15',
    longtitude: 101.71627,
    latitude: 3.201563,
)

User.create(
    username: 'user3',
    first_name: 'user',
    last_name: 'three',
    email: 'user3@mail.com',
    password: "123",
    address: 'Casa Kiara',
    longtitude: 101.646255,
    latitude: 3.168957,
)


User.create(
    username: 'user4',
    first_name: 'user',
    last_name: 'four',
    email: 'user4@mail.com',
    password: "123",
    address: 'TTDI Ascencia',
    longtitude: 101.6278817,
    latitude: 3.1360686,
)

User.create(
    username: 'user5',
    first_name: 'user',
    last_name: 'five',
    email: 'user5@mail.com',
    password: "123",
    address: 'Semantan',
    longtitude: 101.6631873,
    latitude: 3.150991,
)

i = User.last.id
50.times {
    User.create(
        username: "user#{i}",
        first_name: "user",
        last_name: "#{i}",
        email: "user#{i}@mail.com",
        password: "123",
        address: "-",
        longtitude: rand(101.4318908..101.7506561),
        latitude: rand(3.0014384..3.209542),
    )
    p "User#{i} created"
    i += 1
}



2.times {
    User.all.each do  |u|
        Codelang.create(
            user_id: u.id,
            lang: ['ruby', 'javascript', 'python', 'rust', 'c'].sample,
        )
    end
}

Midpoint.create(
    name: 'KLCC Outdoor Plaza',
    address: 'KLCC Outdoor Plaza, Infront Suria KLCC, Kuala Lumpur, 50450, Malaysia',
    description: '',
    longtitude: 101.71126,
    latitude: 3.158599,
    poi: 'poi.1236950609238',
    category: 'outdoors, attraction, tourism',
)

Midpoint.create(
    name: 'Mid Valley Megamall',
    address: 'Mid Valley Megamall, Lingkaran Syed Putra, Kuala Lumpur, 59200, Malaysia',
    description: 'Impossible to find parking',
    longtitude: 101.67693,
    latitude: 3.117723,
    poi: 'poi.1219770754374',
    category: 'mall, shop',
)

Midpoint.create(
    name: 'NEXT Academy',
    address: 'Next Academy, Kuala Lumpur, 60000, Malaysia',
    description: 'An event space',
    longtitude: 101.629845,
    latitude: 3.134673,
    poi: 'poi.1580547980092',
    category: 'college, university, building',
)
p "Midpoint creation complete"