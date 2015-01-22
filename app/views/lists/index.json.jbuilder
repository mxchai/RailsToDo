json.array!(@lists) do |list|
  json.extract! list, :id, :title, :text
  json.url list_url(list, format: :json)
end
