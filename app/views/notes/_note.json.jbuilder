json.extract! note, :id, :text, :user_id, :status, :created_at, :updated_at
json.url note_url(note, format: :json)
