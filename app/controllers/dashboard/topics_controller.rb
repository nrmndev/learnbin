module Dashboard
  class TopicsController < ApplicationController
    before_action :authenticate_user!
    # /dashboard/topics
    def index
      @topics = Topic.all
      @posts = Post.none
    end

    def new
      @category = Category.find(params[:category_id])
      @topic = @category.topics.new
      # then render something, possibly your modal content
    end

     def create

      if @topic.save
        redirect_to dashboard_topic_path(@category), notice: "Topic created"
      else
        # re‑render the view that has the modal, ensure @topic is not nil
        render :show
      end
    end
    #/dashboard/topics/3
    def show
      @category = Category.all
      @topic = Topic.find(params[:id])
      @post = Post.new
      @posts = @topic.posts
    end
    # def topics
    #   @topics = Topic.all
    #   @articles = Article.none
    # end
  end
end
