4.times do
    User.create(username: Faker::FunnyName.name , email: Faker::Internet.email , password: "password")
end

3.times do
    Feature.create(song: Faker::Quote.singular_siegler, artist1: "SZA", artist2: "Kehlani", user_id: 1)
end

3.times do
    Feature.create(song: Faker::Quote.singular_siegler, artist1: "Dami Oniru", artist2: "Oxlade", user_id: 2)
end

3.times do
    Feature.create(song: Faker::Quote.singular_siegler, artist1: "NSG", artist2: "J Hus", user_id: 3)
end

3.times do
    Feature.create(song: Faker::Quote.singular_siegler, artist1: "Pharell", artist2: "Paramore", user_id: 4)
end

