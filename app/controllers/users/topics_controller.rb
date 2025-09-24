module Users
  class TopicsController < ApplicationController
    before_action :set_topic, only: %i[show]
    def index; end

    def set_topic
      #@topic = Topic.find(params[:id])
      #@collections = Collection.all
      @topic = Topic.includes(posts: :parts).find(params[:id])
      @posts = @topic.topic_posts
    end

    def topic_params
      params.require(:topic).permit(:name, :slug, :description, :category_id, :visibility)
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
