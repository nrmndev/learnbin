
  class DashboardController < ApplicationController
    def index
      @categories = Category.all
      @topics = Topic.all
      @articles = Article.none
    end
    # def topics
    #   @topics = Topic.all
    # end
  end
