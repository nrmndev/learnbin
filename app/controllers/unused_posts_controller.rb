# class PostsController < ApplicationController
#   # before_action :set_topic
#   before_action :set_post, only: %i[show edit update destroy]

#   def index
#     @posts = @topic.posts
#   end

#   def show; end

#   # def new
#   #   @post = @topic.posts.new
#   # end


#   # def create
#   #   @post = Post.new(post_params)
#   #   @post.user_id = current_user.id

#   #   if @post.save!
#   #     redirect_to dashboard_posts_path, notice: "post created!"

#   #   end
#   # end

#   def edit; end

#   def update
#     @post.update!(post_params)
#     redirect_to dashboard_post_path(@post), notice: "post updated!"
#     # if @post.update!(post_params)
#     #   redirect_to dashboard_post_path(@post), notice: "post updated!"
#     # end
#   end

#   def destroy
#     @post.destroy
#     redirect_to dashboard_posts_path, notice: "post deleted!"
#   end

#   private


#   def set_post
#     #@post = Post.friendly.find(params[:id])
#     @post = Post.find(params[:id])
#   end

#   def post_params
#     params.require(:post).permit(:title, :slug, :description)
#   end
# end
