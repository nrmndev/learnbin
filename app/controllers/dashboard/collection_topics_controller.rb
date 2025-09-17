module Dashboard
  class CollectionTopicsController < ApplicationController
    before_action :set_collection

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

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end
  end
end
