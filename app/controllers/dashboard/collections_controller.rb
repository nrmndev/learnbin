module Dashboard
  class CollectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_collection, only: %i[show update]
    # /dashboard/topics
    def index
      # @topics = Topic.all
      # @posts = Post.none
    end

    def show; end

    def new
      # @category = Category.find(params[:category_id])
      # @topic = @category.topics.new
      # then render something, possibly your modal content
    end

    def create
      # if @topic.save
      #   redirect_to dashboard_topic_path(@topic), notice: "Topic created"
      # else
      #   # re‑render the view that has the modal, ensure @topic is not nil
      #   render :show
      # end
    end

    def update
      if @collection.update(collection_params)
        redirect_to dashboard_collection_path(@collection), notice: "part updated!"
      else
        render :edit
      end
    end

    def show
      # @topic = Topic.find(params[:id])
    end


    def move_up
      @collection_topic = @collection.collection_topics.find(params[:id])
      @collection_topic.move_higher
      debugger
      redirect_to collection_path(@collection)
    end

    def move_down
      @collection_topic = @collection.collection_topics.find(params[:id])
      @collection_topic.move_lower
      redirect_to collection_path(@collection)
    end

    private

    def set_collection
      #@collection = Collection.find(params[:id])
      @collection = Collection.includes(:topics).find(params[:id])
      # optional: maybe only visible topics, or some scope
      @topics_for_sidebar = @collection.collection_topics
    end

    def collection_params
      params.require(:collection).permit(:title, :visibility, :slug, :description)
    end
  end
end
