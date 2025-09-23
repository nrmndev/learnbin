module Dashboard
  class CollectionsController < Dashboard::BaseController
    before_action :set_collection, only: %i[show update]
    before_action :set_active_link
    # /dashboard/topics
    def index
      # @topics = Topic.all
      # @posts = Post.none
      @grouped_cts = CollectionTopic.includes(:topic).all.group_by(&:collection_id)
      # Optionally load collections so you can show collection titles
      @collections = Collection.where(id: @grouped_cts.keys).index_by(&:id)
      @topics = Topic.all
    end

    def show; end

    def new
      @collection = Collection.new
      @collection.user_id = current_user.id
    end

    def create
      @collection = Collection.new(collection_params)
      @collection.user_id = current_user.id
      if @collection.save!
       # redirect_to dashboard_collections_path, notice: "Collection created"
      else
        # re‑render the view that has the modal, ensure @topic is not nil
        render :index
      end
    end

    def update
      if @collection.update(collection_params)
        flash.now[:notice] = "Collection updated successfully!"
        render turbo_stream: [
          turbo_stream.replace("turbo_dashboard_edit_title", partial: "dashboard/shared/title", locals: { title: @collection.title }),
          # turbo_stream.append("flash", partial: "layouts/flash")
        ]
      else
        render :edit
      end
    end

    def show
      # @topic = Topic.find(params[:id])
    end


    # def move_up
    #   @collection_topic = @collection.collection_topics.find(params[:id])
    #   @collection_topic.move_higher
    #   debugger
    #   redirect_to collection_path(@collection)
    # end

    # def move_down
    #   @collection_topic = @collection.collection_topics.find(params[:id])
    #   @collection_topic.move_lower
    #   redirect_to collection_path(@collection)
    # end

    private

    def set_collection
      @user_collection = Collection.all
      @collection = @user_collection.includes(:topics).find(params[:id])
      # optional: maybe only visible topics, or some scope
      @topics_for_sidebar = @collection.collection_topics
    end

    def set_active_link
      @active_link = 'collections'
    end

    def collection_params
      params.require(:collection).permit(:title, :visibility, :category_id, :slug, :description)
    end
  end
end
