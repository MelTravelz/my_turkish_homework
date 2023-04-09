# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users 
User.create!(user_name: "Jean-Luc-P", email: "captain@uss-enterprise.com", password: "IamCaptain!")
User.create!(user_name: "W-Riker", email: "number2@uss-enterprise.com", password_digest: "IamNumber2")
User.create!(user_name: "Data", email: "data@uss-enterprise.com", password_digest: "IamData?")

# Turkish Words
TurkishVerb.create!(turkish: "(e/a) gitmek", english: "to go")
TurkishVerb.create!(turkish: "(i) istemek", english: "to want")
TurkishVerb.create!(turkish: "(i) bilmek", english: "to know")
TurkishVerb.create!(turkish: "(i) anlamak", english: "to understand")
TurkishVerb.create!(turkish: "(den/dan) korkmak", english: "to be afraid")

