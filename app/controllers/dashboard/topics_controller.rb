module Dashboard
  class TopicsController < Dashboard::BaseController
    before_action :set_topic, only: %i[show update]
    before_action :set_topics, only: %i[index]
    before_action :index_params_permit, only: %i[index]
    before_action :set_active_link
    # /dashboard/topics
    def index
      @posts = Post.none
      if params[:search].present?
        @topics = @topics.user_page_search(params[:search])
      end
    end

    def new
      @topic = Topic.new
      @topic.user = current_user
    end

    def create
      @topic = Topic.new(topic_params)
      @topic.user = current_user
      @topic.save!
      redirect_to dashboard_topics_path, notice: "Topic created"
    end

    def destroy
      @topic = Topic.find(params[:id])
      @topic.destroy!
      redirect_to dashboard_topics_path, notice: "Topic deleted!"
    end


    def update
      @orig_topic = @topic.dup
      @orig_topic.id = @topic.id
      # Also copy slug or whatever your to_param uses:
      @orig_topic.slug = @topic.slug  if @topic.respond_to?(:slug)
      if @topic.update(topic_params)
        redirect_to dashboard_topics_path, notice: "Updated successfully"
      else
        render :show
      end
    end

    def show
       @orig_topic = @topic.dup
      @orig_topic.id = @topic.id
      # Also copy slug or whatever your to_param uses:
      @orig_topic.slug = @topic.slug  if @topic.respond_to?(:slug)
      #@topic = Topic.friendly.find(params[:id])
      @topic = Topic.find(params[:id])
    end

    def move_up
      #ct = @collection.collection_topics.friendly.find(params[:id])
      ct = @collection.collection_topics.find(params[:id])
      ct.move_higher
      redirect_to dashboard_collection_path(@collection)  # sends back to the collection#show page
    end

    def move_down
      #ct = @collection.collection_topics.friendly.find(params[:id])
      ct = @collection.collection_topics.find(params[:id])
      ct.move_lower
      redirect_to dashboard_collection_path(@collection)
    end

    private

    def set_topic
      # Check relavance
      # @collections = Collection.includes(:topics).all

      #@topic = Topic.includes(:posts).friendly.find(params[:id])
      @topic = Topic.includes(:posts).find(params[:id])
      @posts_for_sidebar = @topic.topic_posts
    end

    def set_topics
      @topics = Topic
                .where(user_id: current_user.id)
                .order(title: :asc)
                .paginate(page: params[:page], per_page: 5)
    end

    def index_params_permit
      params.permit(:search)
    end

    def set_active_link
      @active_link = 'topics'
    end

    def topic_params
      params.require(:topic).permit(:title, :slug, :description, :visibility, collection_ids: [])
    end
  end
end
