module Dashboard
  class CategoriesController < ApplicationController
    before_action :authenticate_user!
    # /dashboard/categories
    def index
      @categories = Category.all
      @category = Category.new
    end

    #/dashboard/topics/3
    def show
      @category = Category.find(params[:id])
      @topics = @category.topics
      @topic = Topic.new
    end

  end
end
