json.array!(@coaches) do |coach|
  json.extract! coach, :id, :name, :email, :phone
  json.url coach_url(coach, format: :json)
end
