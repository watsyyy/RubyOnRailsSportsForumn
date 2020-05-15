json.array!(@discussions) do |discussion|
  json.extract! discussion, :title, :location, :excerpt, :body, :published_at
  json.url discussion_url(discussion, format: :json)
end
