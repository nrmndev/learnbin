class SectionsController < ApplicationController
  before_action :set_article
  before_action :set_section, only: %i[show edit update destroy]
  before_action :set_prev, only: %i[show]
  before_action :set_next, only: %i[show]

  def index
    @sections = @article.sections
  end

  def show; end

  def new
    @section = @article.sections.new
  end

  def create
    @section = @article.sections.new(section_params)
    if @section.save
      redirect_to dashboard_category_topic_article_path(@section.article.topic.category_id, @section.article.topic_id, @section.article_id), notice: "Section created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @section.update(section_params)
      redirect_to [@article.topic, @article, @section], notice: "Section updated!"
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to article_sections_path(@article), notice: "Section deleted!"
  end


  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_section
    @section = @article.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:heading, :content, :position)
  end

  def set_prev
    @prev_section = @section.higher_item
  end

  # Get the section with ID greater than current, the closest one
  def set_next
    @next_section = @section.lower_item
  end
end
