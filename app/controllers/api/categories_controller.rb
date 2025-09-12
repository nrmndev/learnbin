module Api
  class CategoriesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      category = Category.new(category_params)
      if category.save
        render json: { message: "Category created", category: category }, status: :created
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.permit(:name, :slug)
    end
  end
end
