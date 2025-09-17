module Dashboard
  class PostsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_topic, only: %i[index show]
    # before_action :set_category, only: %i[index show]
    before_action :set_posts, only: %i[index]
    before_action :set_post, only: %i[show update]

    def index
    end


    def show
      @post = Post.find(params[:id])
      @part = Part.new
    end


    def update
      #@post.update!(post_params)
      #redirect_to dashboard_post_path(@post), notice: "part updated!"
      if @post.update!(post_params)
        redirect_to dashboard_post_path(@post), notice: "part updated!"
      end
    end

    def new
      @post = Post.new
    end

    private

    def post_params
      params.require(:post).permit(:title, :slug, :description)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def set_posts
      @posts = Post.all
    end
  end
end
