class TopicsController < ApplicationController
  before_action :set_category, only: %i[new create]
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @articles = @topic.articles
  end

  def new
    @topic = @category.topics.new
  end

  def create
    @topic = @category.topics.new(topic_params)
    if @topic.save
      redirect_to dashboard_category_path(@topic.category), notice: "Topic created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "Topic updated!"
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "Topic deleted!"
  end


  def articles
    @topic = Topic.find(params[:id])
    @articles = @topic.articles
    @controller = "Sample data coming from controller"
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :slug, :description, :category_id)
  end
end
