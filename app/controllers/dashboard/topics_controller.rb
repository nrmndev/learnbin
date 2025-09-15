module Dashboard
  class TopicsController < ApplicationController
    before_action :authenticate_user!
    # /dashboard/topics
    def index
      @topics = Topic.all
      @articles = Article.none
    end

    def new
      @category = Category.find(params[:category_id])
      @topic = @category.topics.new
      # then render something, possibly your modal content
    end

     def create
      @category = Category.find(params[:category_id])
      @topic = @category.topics.new(topic_params)
      if @topic.save
        redirect_to dashboard_category_topic_path(@category, @topic), notice: "Topic created"
      else
        # re‑render the view that has the modal, ensure @topic is not nil
        render :show
      end
    end
    #/dashboard/topics/3
    def show
      @category = Category.find(params[:category_id])
      @topic = Topic.find(params[:id])
      @article = Article.new
      @articles = @topic.articles
    end
    # def topics
    #   @topics = Topic.all
    #   @articles = Article.none
    # end
  end
end
