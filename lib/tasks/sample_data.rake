namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         address: "Rua Sobe e Desce",
                         postalcode: "1234-567",
                         email: "Examplo@user.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      address = "Example-#{n+1}"
      postalcode  = "#{n+1}"
      email = "bla-#{n+1}@user.com"
      password = "password"
      User.create!(name: name,
                   address: address,
                   postalcode: postalcode,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Shop.create!(name: "Loja 1",
                         address: "Rua nova",
                         postalcode: "1234-567")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      address = "Example-#{n+1}"
      postalcode  = "#{n+1}"
      Shop.create!(name: name,
                   address: address,
                   postalcode: postalcode)
    end
  end
end