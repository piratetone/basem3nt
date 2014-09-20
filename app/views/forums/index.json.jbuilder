json.array!(@forums) do |forum|
  json.extract! forum, :id, :name, :description, :user_id
  json.url forum_url(forum, format: :json)
end
