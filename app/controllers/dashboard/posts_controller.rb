module Dashboard
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_topic, only: %i[index show]
    before_action :set_category, only: %i[index show]
    before_action :set_posts, only: %i[index show]
    # /dashboard/topics/:id/articles
    def index
    end

    #/dashboard/topics/3
    def show
      @post = @posts.find(params[:id])
      @part = Part.new
    end

    private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_posts
      @posts = @topic.posts
    end

    def set_category
      # @category = @topic.category
    end
  end
end
