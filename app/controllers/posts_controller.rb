class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = @topic.posts
  end

  def show; end

  def new
    @post = @topic.posts.new
  end


  def create
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save!
      redirect_to dashboard_topic_path(@topic), notice: "post created!"

    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to [@topic, @post], notice: "post updated!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to topic_posts_path(@topic), notice: "post deleted!"
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :slug, :description)
  end
end
