json.extract! matching_players, :id, :first_name, :last_name, :gender, :birthdate
json.url offer_target_players_url(matching_players, format: :json)
