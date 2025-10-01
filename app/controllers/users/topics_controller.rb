module Users
  class TopicsController < ApplicationController
    before_action :set_topics, only: %i[index]
    before_action :index_params_permit, only: %i[index]

    before_action :set_topic, only: %i[show]
    before_action :show_params_permit, only: %i[show]
    before_action :set_active_link
    def index
      unless turbo_frame_request?
        # not a Turbo frame request, so redirect to main profile page
        return redirect_to username_path(params[:username])
      end
      if params[:search].present?
        @topics = @topics.user_page_search(params[:search])
      end
    end

    def show; end

    private
    def set_topics
      user = User.find_by(username: params[:username])
      @topics = Topic
                .where(user_id: user.id)
                .then do |relation|
                  if current_user && current_user.id == user.id
                    relation  # the user is viewing their own page — don’t filter by visibility
                  else
                    relation.where(visibility: 0) # filter to only public topics (visibility = 0)
                  end
                end
                .where.associated(:topic_posts) #7.1Rails above, filter if there is associated topic and post
                .includes(:topic_posts)
                .paginate(page: params[:page], per_page: 5)
    end

    def topic_params
      params.require(:topic).permit(:name, :slug, :description, :category_id, :visibility)
    end

    def index_params_permit
      params.permit(:user_id, :search)
    end

    def set_topic
      #@topic = Topic.friendly.find(params[:id])
      @topic = Topic.find(params[:id])
    end

    def show_params_permit
      params.permit(:param, :user_id, :username, :id, :user)
    end

    def set_active_link
      @active_link = 'topics'
    end
  end
end


# class TopicsController < ApplicationController
#   before_action :set_category, only: %i[new create]
#   before_action :set_topic, only: %i[show]

#   def index
#     @topics = Topic.all
#      render partial: "dashboard/sections/topics", locals: { topics: @topics }
#   end

#   def show
#     @topic = Topic.includes(posts: :parts).find(params[:id])
#     @posts = @topic.topic_posts
#     respond_to do |format|
#       format.html # ✅ required to replace whole page
#       format.turbo_stream # 👈 if this is first, Turbo might not replace layout
#     end
#   end

#   def new
#     @topic = @category.topics.new
#   end

#   def create
#     @topic = Topic.new(topic_params)
#     @topic.user = current_user
#     if @topic.save
#       redirect_to dashboard_topic_path(@topic.category), notice: "Topic created!"
#     else
#       render :new
#     end
#   end

#   def edit; end



#   def update
#     if @topic.update(topic_params)
#       redirect_to @topic, notice: "Topic updated!"
#     else
#       render :edit
#     end
#   end



#   def articles
#     @topic = Topic.find(params[:id])
#     @articles = @topic.articles
#     @controller = "Sample data coming from controller"
#     respond_to do |format|
#       format.html
#       format.turbo_stream
#     end
#   end

#   private

#   def set_category
#     @category = Category.find(params[:category_id])
#   end

#   def set_topic
#     @topic = Topic.find(params[:id])
#     #@collections = Collection.all
#   end

#   def topic_params
#     params.require(:topic).permit(:name, :slug, :description, :category_id, :visibility)
#   end
# end
