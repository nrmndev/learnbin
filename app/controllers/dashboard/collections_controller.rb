module Dashboard
  class CollectionsController < Dashboard::BaseController
    before_action :set_collection, only: %i[show update]
    before_action :set_collections, only: %i[index]
    before_action :set_active_link
    # /dashboard/topics
    def index
      if params[:search].present?
        @collections = @collections.user_page_search(params[:search])
      end
    end

    def show; end

    def new
      @collection = Collection.new
    end

    def create
      @collection = Collection.new(collection_params)
      @collection.user_id = current_user.id

      if @collection.save!
        redirect_to dashboard_collections_path, notice: "Collection created"
      else
        # re‑render the view that has the modal, ensure @topic is not nil
        render :index
      end
    end

    def update
      @collection.update(collection_params)
      redirect_to dashboard_collections_path
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


    def set_collections
      @collections = Collection
                .where(user_id: current_user)
                .order(title: :asc)
                .paginate(page: params[:page], per_page: 20)
    end

    def set_collection
      #@user_collection = Collection.friendly.find(params[:id])
      @user_collection = Collection.find(params[:id])
      @collection = @user_collection
      # optional: maybe only visible topics, or some scope
      @topics_for_sidebar = @collection.collection_topics
    end

    def set_active_link
      @active_link = 'collections'
    end


    def collection_params
      params.require(:collection).permit(:title, :visibility, :category_id, :description)
    end
  end
end
