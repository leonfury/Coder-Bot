# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Midpoint.create(
    address: '',
    description: 'KLCC',
    longtitude: 101.712234,
    latitude: 3.151902,
    poi: 'poi.1116691549419',
)

Midpoint.create(
    address: '',
    description: 'Next Academy',
    longtitude: 101.629845,
    latitude: 3.134673,
    poi: 'poi.1580547980092',
)

Midpoint.create(
    address: '',
    description: 'Mid Valley',
    longtitude: 101.67693,
    latitude: 3.117723,
    poi: 'poi.1219770754374',
)
