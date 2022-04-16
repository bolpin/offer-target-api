json.extract! players, :id, :first_name, :last_name, :gender_id, :birthdate
json.url offer_target_players_url(matching_players, format: :json)
