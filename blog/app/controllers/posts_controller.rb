class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc)
  end

  # POST /posts
  # POST /posts.json
  def create
    uploaded_io = params[:post][:picture_file]
    @post = Post.new(post_params.merge(picture: uploaded_io.original_filename))
    upload_dir = Rails.root.join('public', 'uploads')
    FileUtils.mkdir_p(upload_dir)
    File.open(Rails.root.join(upload_dir, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'index' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end
end
