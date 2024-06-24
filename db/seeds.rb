# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Destroying database...'
Hero.destroy_all
User.destroy_all

puts 'Creating Users...'
users = [
  { email: "user1@hero2go.com", username: "user1", password: "azerty1" },
  { email: "user2@hero2go.com", username: "user2", password: "azerty2" },
  { email: "user3@hero2go.com", username: "user3", password: "azerty3" },
  { email: "user4@hero2go.com", username: "user4", password: "azerty4" },
  { email: "user5@hero2go.com", username: "user5", password: "azerty5" }
]

users.each do |user_data|
  User.create!(user_data)
end

require 'open-uri'

puts 'Creating Heros...'
heros = [
  { name: "Tchokolatine",
    role: "support",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241478/development/tchokolatine_benpjv.jpg",
    job: "cleric", guild: "Trinity", description: "Premium healer, won't run out of mana. You'll feel invincible!",
    price: 999, user: User.find_by(email: "user1@hero2go.com")},

  { name: "Victor G. mane",
    role: "tank",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241485/development/victor_g_mane_imh9x8.jpg",
    job: "knight", guild: "Trinity",
    description: "With a full gold armor. Pricy and arrogant but the most efficient human shield!",
    price: 9999, user: User.find_by(email: "user1@hero2go.com")},

  { name: "Kayno",
    role: "magical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241444/development/kayno_v17ttc.jpg",
    job: "wizard",
    guild: "Trinity",
    description: "Smart and strong...will BURN all your enemies in a blink of an eye...",
    price: 500,
    user: User.find_by(email: "user1@hero2go.com") },

  { name: "Kofi",
    role: "physical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241469/development/kofi_kriuso.jpg",
    job: "fighter", guild: "Le Wagon",
    description: "He won't sleep in the battlefield",
    price: 500,
    user: User.find_by(email: "user2@hero2go.com") },

  { name: "Tee",
    role: "support",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241480/development/tee_npwvwn.jpg",
    job: "alchemist",
    guild: "Le Wagon",
    description: "Can give some extra juice to your fighters. Come with extra secret cocktail for free!",
    price: 800,
    user: User.find_by(email: "user2@hero2go.com") },

  { name: "Mug",
    role: "physical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241475/development/mug_e44f13.jpg",
    job: "ranger",
    guild: "Le Wagon",
    description: "Your opponent will only be able to hear the knock of deathwhistle",
    price: 890,
    user: User.find_by(email: "user2@hero2go.com") },

  { name: "Sol B.",
    role: "tank",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241477/development/sol_b_wrlvhg.jpg",
    job: "paladin",
    guild: "The Fabulous",
    description: "A.K.A. Order Sol. The real bad guy",
    price: 400,
    user: User.find_by(email: "user3@hero2go.com") },

  { name: "Dan'Ghul",
    role: "magical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241415/development/dan_ghul_bnscff.jpg",
    job: "warlock",
    guild: "The Fabulous",
    description: "So powerful that some other warlock litteraly copy his name",
    price: 1500,
    user: User.find_by(email: "user3@hero2go.com") },

  { name: "Benedict Strange",
    role: "magical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241413/development/benedict_strange_nurnfx.jpg",
    job: "wizard",
    guild: "The Fabulous",
    description: "The most briliant time bender",
    price: 1000,
    user: User.find_by(email: "user3@hero2go.com") },

  { name: "Maron Bordo",
    role: "magical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241473/development/maron_bordo_pwmwnf.jpg",
    job: "warlock",
    guild: "Haze Roth",
    description: "The famous mana leecher",
    price: 2000,
    user: User.find_by(email: "user4@hero2go.com") },

  { name: "Anne Dwin",
    role: "support",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241412/development/anne_dwin_ypu5v4.jpg",
    job: "cleric",
    guild: "Haze Roth",
    description: "Daughter of queen Varyan, from the most famous cleric order",
    price: 2000,
    user: User.find_by(email: "user4@hero2go.com") },

  { name: "The Hollow",
    role: "tank",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241482/development/the_hollow_cho308.jpg",
    job: "knight",
    guild: "Haze Roth",
    description: "with a strange insect shaped armor,The Hollow will deflect all the attacks",
    price: 2200,
    user: User.find_by(email: "user4@hero2go.com") },

  { name: "Dee Luffy",
    role: "support",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241417/development/dee_luffy_oi5tol.jpg",
    job: "monk",
    guild: "Omnislash",
    description: "The famous monkey, ex-pirate, now can heal you with mixture of strange recipes and prayers",
    price: 10,
    user: User.find_by(email: "user5@hero2go.com") },

  { name: "Malefixx",
    role: "physical",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241471/development/malefixx_bxuyyj.jpg",
    job: "assassin",
    guild: "Omnislash",
    description: "....Slash....",
    price: 15,
    user: User.find_by(email: "user5@hero2go.com") },

  { name: "Gougeul Stryfe",
    role: "tank",
    picture: "https://res.cloudinary.com/dlh0ap8um/image/upload/v1719241442/development/gougeul_stryfe_gtiwdr.jpg",
    job: "knight",
    guild: "Omnislash",
    description: "The best soldier from materia academy",
    price: 50,
    user: User.find_by(email: "user5@hero2go.com") }
]

heros.each do |hero_data|
  picture = hero_data.delete(:picture)
  hero = Hero.new(hero_data)
  file = URI.open(picture)

  hero.picture.attach(io: file, filename: File.basename(picture), content_type: "image/jpg")
  hero.save
end

puts 'Finished!'
