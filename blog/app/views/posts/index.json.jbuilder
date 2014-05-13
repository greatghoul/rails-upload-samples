json.array!(@posts) do |post|
  json.extract! post, :id, :content, :picture
  json.url post_url(post, format: :json)
end
