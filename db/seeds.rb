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

puts 'Creating Heros...'
heros = [
  { name: "Tchokolatine", role: "support", picture: "app/assets/images/hero_images/tchokolatine.jpeg", job: "cleric", guild: "Trinity", description: "Premium healer, won't run out of mana. You'll feel invincible!", price: 999, user: User.find_by(email: "user1@hero2go.com") },
  { name: "Victor G. mane", role: "tank", picture: "app/assets/images/hero_images/victor_g_mane.jpg", job: "knight", guild: "Trinity", description: "With a full gold armor. Pricy and arrogant but the most efficient human shield!", price: 9999, user: User.find_by(email: "user1@hero2go.com") },
  { name: "Kayno", role: "magical", picture: "app/assets/images/hero_images/kayno.jpg", job: "wizard", guild: "Trinity", description: "Smart and strong...will BURN all your enemies in a blink of an eye...", price: 500, user: User.find_by(email: "user1@hero2go.com") },
  { name: "Kofi", role: "physical", picture: "app/assets/images/hero_images/kofi.jpg", job: "fighter", guild: "Le Wagon", description: "He won't sleep in the battlefield", price: 500,user: User.find_by(email: "user2@hero2go.com") },
  { name: "Tee", role: "support", picture: "app/assets/images/hero_images/tee.jpg", job: "alchemist", guild: "Le Wagon", description: "Can give some extra juice to your fighters. Come with extra secret cocktail for free!", price: 800, user: User.find_by(email: "user2@hero2go.com") },
  { name: "Mug", role: "physical", picture: "app/assets/images/hero_images/mug.jpg", job: "ranger", guild: "Le Wagon", description: "Your opponent will only be able to hear the knock of deathwhistle", price: 890, user: User.find_by(email: "user2@hero2go.com") },
  { name: "Sol B.", role: "tank", picture: "app/assets/images/hero_images/sol_b.jpg", job: "paladin", guild: "The Fabulous", description: "A.K.A. Order Sol. The real bad guy", price: 400, user: User.find_by(email: "user3@hero2go.com") },
  { name: "Dan'Ghul", role: "magical", picture: "app/assets/images/hero_images/dan_ghul.jpg", job: "warlock", guild: "The Fabulous", description: "So powerful that some other warlock litteraly copy his name", price: 1500, user: User.find_by(email: "user3@hero2go.com") },
  { name: "Benedict Strange", role: "magical", picture: "app/assets/images/hero_images/benedict_strange.jpg", job: "wizard", guild: "The Fabulous", description: "The most briliant time bender", price: 1000, user: User.find_by(email: "user3@hero2go.com") },
  { name: "Maron Bordo", role: "magical", picture: "app/assets/images/hero_images/maron_bordo.jpg", job: "warlock", guild: "Haze Roth", description: "The famous mana leecher", price: 2000, user: User.find_by(email: "user4@hero2go.com") },
  { name: "Anne Dwin", role: "support", picture: "app/assets/images/hero_images/anne_dwin.jpg", job: "cleric", guild: "Haze Roth", description: "Daughter of queen Varyan, from the most famous cleric order", price: 2000, user: User.find_by(email: "user4@hero2go.com") },
  { name: "The Hollow", role: "tank", picture: "app/assets/images/hero_images/the_hollow.jpg", job: "knight", guild: "Haze Roth", description: "with a strange insect shaped armor,The Hollow will deflect all the attacks", price: 2200, user: User.find_by(email: "user4@hero2go.com") },
  { name: "Dee Luffy", role: "support", picture: "app/assets/images/hero_images/dee_luffy.jpg", job: "monk", guild: "Omnislash", description: "The famous monkey, ex-pirate, now can heal you with mixture of strange recipes and prayers", price: 10, user: User.find_by(email: "user5@hero2go.com") },
  { name: "Malefixx", role: "physical", picture: "app/assets/images/hero_images/malefixx.jpg", job: "assassin", guild: "Omnislash", description: "....Slash....", price: 15, user: User.find_by(email: "user5@hero2go.com") },
  { name: "Gougeul Stryfe", role: "tank", picture: "app/assets/images/hero_images/gougeul_stryfe.jpg", job: "knight", guild: "Omnislash", description: "The best soldier from materia academy", price: 50, user: User.find_by(email: "user5@hero2go.com") }
]

heros.each do |hero_data|
  picture = hero_data.delete(:picture)
  hero = Hero.new(hero_data)
  hero.picture.attach(io: File.open(picture), filename: picture, content_type: "image/jpg")
  hero.save
end

puts 'Finished!'
