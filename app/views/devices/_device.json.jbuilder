json.extract! device, :id, :model, :os_major_version, :os_minor_version, :os_patch_version, :player_id, :operating_system_id, :locale_id, :created_at, :updated_at
json.url device_url(device, format: :json)
