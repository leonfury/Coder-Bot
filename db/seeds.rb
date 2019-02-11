# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.delete_all
Midpoint.delete_all
Event.delete_all
Invite.delete_all
Hotel.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(:users);
ActiveRecord::Base.connection.reset_pk_sequence!(:midpoints);
ActiveRecord::Base.connection.reset_pk_sequence!(:events);
ActiveRecord::Base.connection.reset_pk_sequence!(:invites);
ActiveRecord::Base.connection.reset_pk_sequence!(:hotels);


User.create(
    username: 'user1',
    first_name: 'user',
    last_name: 'one',
    email: 'user1@mail.com',
    password: "123",
    address: 'Desa Kiara Condominium',
    longtitude: 101.63043,
    latitude: 3.133894,
    poi: "po_1"
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
    poi: "po_2"
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
    poi: "po_3"
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
    poi: "po_4"
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
    poi: "po_5"
)

i = User.last.id
100.times {
    User.create(
        username: Faker::FunnyName.name,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "user#{i+1}@mail.com",
        password: "123",
        address: "-",
        # longtitude: rand(101.4318908..101.7506561),
        # latitude: rand(3.0014384..3.209542),
        longtitude: rand(101.4318908..103.7506561),
        latitude: rand(2.0014384..3.809542),
        poi: "poi_#{i+1}",
        avatar: Faker::Avatar.image,
    )
    p "User#{i+1} created"
    i += 1
}

User.all.each do  |u|
    u.update(lang: ['ruby', 'javascript', 'python', 'css'].sample)
end

Midpoint.create(
    name: '-',
    address: '-',
    description: '',
    longtitude: 0,
    latitude: 0,
    poi: 'poi.0',
    category: '-',
)

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

50.times {
    Midpoint.create(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        description: Faker::TvShows::GameOfThrones.quote,
        longtitude: rand(101.4318908..103.7506561),
        latitude: rand(2.0014384..3.809542),
        category: ['coffee', 'workspace', 'eventspace', 'cafe'].sample,
    )
    p "Midpoint created"
}
p "Midpoint creation complete"



# School
csv_text = File.read(Rails.root.join('lib', 'seeds', 'kl_hotel.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    h = Hotel.new
    h.hotel_name = row['name']
    h.star = row['stars']
    h.price = row['price']
    h.city = row['city']
    h.address = row['address']
    h.link = row['url']
    h.longtitude = row['longtitude']
    h.latitude = row['latitude']
    h.save
    puts "#{h.hotel_name} saved"
end