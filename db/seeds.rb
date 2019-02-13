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
    username: 'Alex',
    first_name: 'alex',
    last_name: 'chen',
    email: 'alex@mail.com',
    password: "123",
    address: 'Bandar Sri Permaisuri',
    longtitude: "101.7180796",
    latitude: "3.10015901",
    poi: "po_1",
    lang: "css",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/alex-ea6bbe7fc1fd0ae821ca417b69b3d6586a8a99f19518a787cb55c79d36af29bc.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Ben',
    first_name: 'ben',
    last_name: 'Sommerbille',
    email: 'ben@mail.com',
    password: "123",
    address: 'Bukit Tabur',
    longtitude: "101.74908",
    latitude: "3.233591",
    poi: "po_2",
    lang: "javascript",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/ben-302fc1586b2eee54b8a63e9f8cf02abd1e4147e3689c2b6771aa0b24fe130037.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Callum Boy',
    first_name: 'callum',
    last_name: 'tan',
    email: 'callum@mail.com',
    password: "123",
    address: 'Sentul',
    longtitude: "101.695755",
    latitude: "3.19358",
    poi: "po_3",
    lang: "css",
    joined: Date.today(),
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/callum-747e9e0de7c93f118c31da3684da33211cc9a33ca24aa714836875760a07d2da.jpg',
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Dave',
    first_name: 'dave',
    last_name: 'lee',
    email: 'dave@mail.com',
    password: "123",
    address: 'B50, Jalan Dato Lim Hoe Lek, Kampung Mutan Setali, 25200 Kuantan, Pahang',
    longtitude: "103.32653",
    latitude: "3.822586",
    poi: "po_4",
    lang: "python",
    joined: "12 Feb 2011",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/dave-2681b47a0c34aa9fbb0becd96bf175c094c320203ccef3a76103bc6ba2a51561.jpg',
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Diana',
    first_name: 'diana',
    last_name: 'Seidakhmetova',
    email: 'diana@mail.com',
    password: "123",
    address: 'H2O Residence',
    longtitude: "101.5770139",
    latitude: "3.11592406",
    poi: "po_5",
    lang: "ruby",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/diana-e9d07dd6ed1934a5152c240283ab3d8d2ed102c1c87975e4f3602a5863bca8bb.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Farah',
    first_name: 'farah',
    last_name: 'far',
    email: 'farah@mail.com',
    password: "123",
    address: 'Paramount Garden',
    longtitude: "101.59372",
    latitude: "3.15066",
    poi: "po_6",
    lang: "python",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/farah-d9c8dd05150410d11f680202d3c4c52c933455a5d2957256666183ad74b49ee7.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Garic',
    first_name: 'garic',
    last_name: 'Poon',
    email: 'garic@mail.com',
    password: "123",
    address: 'Taman Midah',
    longtitude: "101.7322467",
    latitude: "3.0999565",
    poi: "po_7",
    lang: "css",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/garic-fe157fd1d38c641982c0ee2c26c08b28df74ebc2faba9fa59c9a9937839487a4.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Joel',
    first_name: 'joel',
    last_name: 'MacDonald',
    email: 'joel@mail.com',
    password: "123",
    address: 'SS2 ',
    longtitude: "101.63834",
    latitude: "3.095739",
    poi: "po_8",
    lang: "javascript",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/joel-4757ab5d50f60e7ccf4700ccfa7588ee05a10b7bde8bad63857e3d414527189e.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Kevin',
    first_name: 'kevin',
    last_name: 'Devastian',
    email: 'kevin@mail.com',
    password: "123",
    address: 'Kelana Jaya',
    longtitude: "101.60833",
    latitude: "3.10667",
    poi: "po_9",
    lang: "ruby",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/kevin-8f8e9c72227c9120eac7f0c17683658b11bdbb1eb6eb1bd070c55cbed2b3e035.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


User.create(
    username: 'Codeyluke',
    first_name: 'luke',
    last_name: 'Sia',
    email: 'luke@mail.com',
    password: "123",
    address: 'Damansara Utama',
    longtitude: "101.619693267",
    latitude: "3.1363969",
    poi: "po_10",
    lang: "ruby",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/luke-11e27ab2f05a369989db3a30f35cad4e29dd657922214d8fae1e1741b3bddec6.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


User.create(
    username: 'Prophet Symnal',
    first_name: 'malcolm',
    last_name: 'Jeremiah',
    email: 'malcolm@mail.com',
    password: "123",
    address: 'Penang Hill',
    longtitude: "100.249517",
    latitude: "5.374512827",
    poi: "po_11",
    lang: "ruby",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/malcolm-1b62d4956a4fa062c45d3ca5054ea56f2812a416c62961bf4dbc970f88a5493e.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


User.create(
    username: 'Sampras???',
    first_name: 'sam',
    last_name: 'Lee',
    email: 'sam@mail.com',
    password: "123",
    address: 'Bangsar',
    longtitude: "101.66731",
    latitude: "3.142963",
    poi: "po_12",
    lang: "python",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/sam-2116595323de628fadafde12ba5721147812220dd295f626620021b307b2078c.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Sonaly',
    first_name: 'sonaly',
    last_name: 'Verma',
    email: 'sonaly@mail.com',
    password: "123",
    address: 'Villa Mont Kiara',
    longtitude: "101.66587",
    latitude: "3.171066",
    poi: "po_13",
    lang: "css",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/sonaly-5d3ccbb387ecaade153c2eea2c6c3a4431296d3008a264a9933098a66a6d007a.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


User.create(
    username: 'Wesley',
    first_name: 'wesley',
    last_name: 'Weston',
    email: 'wesley@mail.com',
    password: "123",
    address: 'Shah Alam Sec 10',
    longtitude: "101.53333",
    latitude: "3.08333",
    poi: "po_14",
    lang: "python",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/wesley-fc81a76ab45104732ff06726a7f1402278754ecdbe60c4c17e009a8e7d7b9b13.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


User.create(
    username: '12 PM Biscuit Man',
    first_name: 'yijun',
    last_name: 'Lim',
    email: 'yijun@mail.com',
    password: "123",
    address: 'Taman Eden, Ipoh',
    longtitude: "101.0722796",
    latitude: "4.608419778",
    poi: "po_15",
    lang: "css",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/yijun-ef34cc021a6b2e77ee42b5861d5dc12eeb04f6349fd0089b48cdb5ac617b34f1.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)

User.create(
    username: 'Haris',
    first_name: 'haris',
    last_name: 'Mazlan',
    email: 'haris@mail.com',
    password: "123",
    address: 'Kwasa Damansara',
    longtitude: "101.57475",
    latitude: "3.175736",
    poi: "po_16",
    lang: "javascript",
    avatar: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/users/haris-804297d0104dcf785fe9adf2d0f8ad96607607175b340fb7a3359ccf98aebef8.jpg',
    joined: Date.today(),
    description: Faker::TvShows::GameOfThrones.quote,
)


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
    description: 'Meet at KLCC Outdoor Park',
    longtitude: 101.71126,
    latitude: 3.158599,
    poi: 'poi.1236950609238',
    category: 'outdoors, attraction, tourism',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/klccoutdoorplaza-7ba732977305c24ed73f45b6287e68293e623e279e63114745b6d60e2b636e1d.jpg',
)

Midpoint.create(
    name: 'Mid Valley Megamall',
    address: 'Mid Valley Megamall, Lingkaran Syed Putra, Kuala Lumpur, 59200, Malaysia',
    description: 'Impossible to find parking',
    longtitude: 101.67693,
    latitude: 3.117723,
    poi: 'poi.1219770754374',
    category: 'mall, shop',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/midvalleymegamall-17d0540779cbcea8088246f7123e27a338e3c0d4a03458133037c893ec99c55a.jpg',
)
=begin
Midpoint.create(
    name: 'NEXT Academy',
    address: 'Next Academy, Kuala Lumpur, 60000, Malaysia',
    description: 'An event space',
    longtitude: 101.629845,
    latitude: 3.134673,
    poi: 'poi.1580547980092',
    category: 'college, university, building',
)
=end
Midpoint.create(
    name: 'WorQ Glo Damansara',
    address: 'WorQ Glo Damansara, Level 3A-1A Glo Damansara Shopping Mall, Selangor 60000, Malaysia',
    description: 'A co-working space',
    longtitude: "101.63028",
    latitude: "3.133192",
    poi: 'poi.532575957367',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/worqglo-85e9d5ff885d23f5634d3a9289e53b0b0c9e4a117f8653c51299a052e1c09299.jpg',
)


Midpoint.create(
    name: 'WorQ UOA Business Park',
    address: 'UOA Business Park, No. 1 Jalan Pengaturcara U1/51A, Shah Alam, Selangor 40150, Malaysia',
    description: 'A co-working space',
    longtitude: "101.58643",
    latitude: "3.0866",
    poi: 'poi.1314260031596',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/worquoa-f3e8f5a5e1ae3adf61bd58037133723eb4668279bb5c34f00080e4f1bb3e0845.jpg',
)

Midpoint.create(
    name: 'H Space, Petaling Jaya',
    address: 'H Space, Jalan PJU 5/1, Kota Damansara, Petaling Jaya, Selangor 47810, Malaysia',
    description: 'A co-working space',
    longtitude: "101.59703",
    latitude: "3.154741",
    poi: 'poi.360777254997',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/hspacekotadamansara-ece42f1407fce81615c2c6ca2310bf33ebc23d2e41c65718a22912825aba60f8.jpg',
)

Midpoint.create(
    name: 'Tedboy Express @ Menara Standard Chartered',
    address: 'Lot 1.4, Ground Floor, Menara Standard Chartered, No., 30, Jalan Sultan Ismail, Bukit Bintang, Kuala Lumpur, Malaysia',
    description: 'A co-working space',
    longtitude: "101.71121",
    latitude: "3.149833",
    poi: 'poi.1580548015986',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/tedboyexpress-a5ba23c8882f1a9965f1fa27cccbbc1ba376bc522c9aa151812c173d959052ee.jpg',
)

Midpoint.create(
    name: 'The Co. - The Row @ Chow Kit',
    address: 'No. 42-48, Jalan Doraisamy, Chow Kit, Kuala Lumpur, Malaysia',
    description: 'A co-working space',
    longtitude: "101.69927",
    latitude: "3.166502",
    poi: 'poi.1314260001920',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/thecotherow-bccf44b10440a0e5c1fd6f20f55446555942e2af08812ee04488dc8b840df945.jpg',
)

Midpoint.create(
    name: 'PAPER + TOAST @ Bukit Bintang',
    address: 'Level 13A, Fahrenheit Office Tower, Jalan Gading, Bukit Bintang, Kuala Lumpur, Malaysia',
    description: 'A co-working space',
    longtitude: "101.710625",
    latitude: "3.147366",
    poi: 'poi.26628798156',
    category: 'work space',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/paperandtoast-83ead71385e8e3913c48b02e17e081524113ec2c98d4e9ad1f0dfd7f2dd9395e.jpg',
)

Midpoint.create(
    name: 'Pulau Tikus Penang @ Penang',
    address: 'Georgetown',
    description: 'Many food',
    longtitude: "100.31180984",
    latitude: "5.4317162436",
    poi: 'poi.',
    category: 'food street',
    photo: 'https://next-academy-group-1-coder-bot.herokuapp.com/assets/mps/pulautikuspenang-66c179c6de99dd97ef3186d7b9e819d0e6843b85ebf88ae1535beeab3354e572.jpg',
)


15.times {
    Midpoint.create(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        description: Faker::TvShows::GameOfThrones.quote,
        longtitude: rand(101.4002711836..101.8997188),
        latitude: rand(2.8743528..4.243149346),
        category: ['coffee', 'workspace', 'eventspace', 'cafe'].sample,
        photo: Faker::Avatar.image,
    )
    p "Midpoint created"
}

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

Event.create(
    user_id: 10,
    midpoint_id: 1, #4
    remark: "Top Secret Project",
    event_date: "Mon, 18 Feb 2019",
    event_time: "Sat, 01 Jan 2000 05:00:00 UTC +00:00",
)

Invite.create(event_id: 1, user_id: 16)
Invite.create(event_id: 1, user_id: 8)
Invite.create(event_id: 1, user_id: 14)
Invite.create(event_id: 1, user_id: 12)
Invite.create(event_id: 1, user_id: 11)
Invite.create(event_id: 1, user_id: 10)


Event.create(
    user_id: 11,
    midpoint_id: 10, #4
    remark: "Project Facebook",
    event_date: "Thu, 21 Feb 2019",
    event_time: "Sat, 01 Jan 2000 22:30:00 UTC +00:00",
)


Invite.create(event_id: 2, user_id: 11)
Invite.create(event_id: 2, user_id: 15)

=begin
sign in luke
colab with
- sam
- joel
- kevin
- haris
- yijun

meet at worq glo damansara

sign in yijun account
for hotels


sign in dave account for
meetings



highlight distance too far!


=end