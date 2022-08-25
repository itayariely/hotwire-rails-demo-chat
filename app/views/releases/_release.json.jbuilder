json.extract! release, :id, :release_date, :release_title, :release_description, :str, :created_at, :updated_at
json.url release_url(release, format: :json)
