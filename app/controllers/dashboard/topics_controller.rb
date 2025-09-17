module Dashboard
  class TopicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_topic, only: %i[show update]
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
        redirect_to dashboard_topic_path(@topic), notice: "Topic created"
      else
        # re‑render the view that has the modal, ensure @topic is not nil
        render :show
      end
    end

    def update
      if @topic.update(topic_params)
        redirect_to dashboard_topic_path(@topic), notice: "part updated!"
      else
        render :edit
      end
    end

    def show
      @topic = Topic.find(params[:id])
    end


    private

    def set_topic
      @topic = Topic.find(params[:id])

      @collections = Collection.all
    end

    def topic_params
      params.require(:topic).permit(:title, :slug, :description, :visibility, collection_ids: [])
    end
  end
end
