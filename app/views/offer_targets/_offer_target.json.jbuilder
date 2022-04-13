json.extract! offer_target, :id, :offer_id, :min_player_age, :max_player_age, :operating_system_id, :min_os_major_version, :min_os_minor_version, :min_os_patch_version, :locale_id, :gender_id, :created_at, :updated_at
json.url offer_target_url(offer_target, format: :json)
