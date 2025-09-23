module Dashboard
  class TopicsController < Dashboard::BaseController
    before_action :set_topic, only: %i[show update]
    before_action :set_topics, only: %i[index]
    before_action :set_active_link
    # /dashboard/topics
    def index
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

    def destroy
      @topic = Topic.find(params[:id])
      @topic.destroy!
      redirect_to dashboard_topics_path, notice: "Topic deleted!"
    end


    def update
      if @topic.update(topic_params)
        flash.now[:notice] = "Topic updated successfully!"
        render turbo_stream: [
          turbo_stream.replace("turbo_dashboard_edit_title", partial: "dashboard/shared/title", locals: { title: @topic.title }),
          # turbo_stream.append("flash", partial: "layouts/flash")
        ]
      else
        render :edit
      end
    end

    def show
      @topic = Topic.find(params[:id])
    end

    def move_up
      ct = @collection.collection_topics.find(params[:id])
      ct.move_higher
      redirect_to dashboard_collection_path(@collection)  # sends back to the collection#show page
    end

    def move_down
      ct = @collection.collection_topics.find(params[:id])
      ct.move_lower
      redirect_to dashboard_collection_path(@collection)
    end

    private

    def set_topic
      # Check relavance
      # @collections = Collection.includes(:topics).all

      @topic = Topic.includes(:posts).find(params[:id])
      @posts_for_sidebar = @topic.topic_posts
    end

    def set_topics
      @topics = Topic.where(user: current_user)
    end

    def set_active_link
      @active_link = 'topics'
    end

    def topic_params
      params.require(:topic).permit(:title, :slug, :description, :visibility, collection_ids: [])
    end
  end
end
