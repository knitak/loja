namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         address: "Rua do Sobe e Desce",
                         postalcode: "1234-567")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      address = "Example-#{n+1}"
      postalcode  = "0000-000"
      User.create!(name: name,
                   address: address,
                   postalcode: postalcode)
    end
  end
end