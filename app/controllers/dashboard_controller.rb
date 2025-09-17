
  class DashboardController < ApplicationController

    def index
      @collections = Collection.all
      @topics = Topic.all
    end
    # def topics
    #   @topics = Topic.all
    # end
  end
