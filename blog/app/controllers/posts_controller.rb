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
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { render partial: 'post', object: @post }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :picture)
    end
end
