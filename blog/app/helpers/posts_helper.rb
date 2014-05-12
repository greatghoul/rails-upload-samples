module PostsHelper
  def post_picture_url(picture)
    root_url + '/uploads/' + picture
  end
end
