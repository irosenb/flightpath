json.array!(@flights) do |flight|
  json.extract! flight, :id, :user_id
  json.url flight_url(flight, format: :json)
end
