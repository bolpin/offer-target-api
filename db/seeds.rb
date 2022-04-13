# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Gender.create(name: 'female')
Gender.create(name: 'male')
Gender.create(name: 'non-binary')

Locale.create(code: 'en_CA')
Locale.create(code: 'en_GB')
Locale.create(code: 'en_US')
Locale.create(code: 'es_AR')
Locale.create(code: 'es_MX')
Locale.create(code: 'es_US')
Locale.create(code: 'fr_FR')
Locale.create(code: 'zh_TW')

OperatingSystem.create(name: 'android')
OperatingSystem.create(name: 'ios')

Offer.create(title: 'Offer 1', header: '$5 gift card',
             description: 'Good until Sunday at noon',
             points: 100,
             payout_cents: 100)
Offer.create(title: 'Special Offer', header: 'More rewards',
             description: 'Get it now',
             points: 100,
             payout_cents: 375)
Offer.create(title: 'Small Offer', header: 'Pennies',
             description: 'Well, not the best payout',
             points: 100,
             payout_cents: 1)


# os version
OfferTarget.create(offer_id: 1,
                   min_player_age: 1,
                   max_player_age: 100,
                   operating_system_id: 1,
                   min_os_major_version: 10,
                   min_os_minor_version: 0,
                   min_os_patch_version: 0,
                   locale_id: 1,
                   gender_id: 1)

# player age
OfferTarget.create(offer_id: 1,
                   min_player_age: 18,
                   max_player_age: 23,
                   operating_system_id: 1,
                   min_os_major_version: 0,
                   min_os_minor_version: 0,
                   min_os_patch_version: 1,
                   locale_id: 1,
                   gender_id: 1)

# os
OfferTarget.create(offer_id: 1,
                   min_player_age: 1,
                   max_player_age: 100,
                   operating_system_id: 2,
                   min_os_major_version: 0,
                   min_os_minor_version: 0,
                   min_os_patch_version: 1,
                   locale_id: 1,
                   gender_id: 1)

# locale
OfferTarget.create(offer_id: 1,
                   min_player_age: 1,
                   max_player_age: 100,
                   operating_system_id: 1,
                   min_os_major_version: 0,
                   min_os_minor_version: 0,
                   min_os_patch_version: 1,
                   locale_id: 2,
                   gender_id: 1)

# gender
OfferTarget.create(offer_id: 1,
                   min_player_age: 1,
                   max_player_age: 100,
                   operating_system_id: 1,
                   min_os_major_version: 0,
                   min_os_minor_version: 0,
                   min_os_patch_version: 1,
                   locale_id: 1,
                   gender_id: 2)

# other offer
OfferTarget.create(offer_id: 2,
                   min_player_age: 1,
                   max_player_age: 100,
                   operating_system_id: 1,
                   min_os_major_version: 0,
                   min_os_minor_version: 0,
                   min_os_patch_version: 1,
                   locale_id: 1,
                   gender_id: 1)


  # player = Player.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthdate: n.years.ago.yesterday.to_date, gender_id: (n % 3) + 1)
  # device = Device.create( model: Faker::Device.model_name, operating_system_id: n % 2 == 0 ? 1 : 2, os_major_version: Faker::Device.version, os_minor_version: 1, os_patch_version: n % 20, locale_id: (n % 2) + 1, player_id: player.id)

# Create 50 Players with associated devices
# Gender, device locale, device operating system, and os_patch_version are evenly distributed
# Player age and os patch version are unique and correlated
# OS major version is random
(31..80).each do |n|
  player = Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: n.years.ago.yesterday.to_date,
    gender_id: (n % 3) + 1
  )

  device = Device.create(
    model: Faker::Device.model_name,
    operating_system_id: n % 2 == 0 ? 1 : 2,
    os_major_version: n % 20,
    os_minor_version: 1,
    os_patch_version:Faker::Device.version,
    locale_id: (n % 2) + 1,
    player_id: player.id
  )
end

Faker::Number.within(range: 1..10)
