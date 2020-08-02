class SearchesController < ApplicationController
  def index
    render json: Search.all
  end

  def create
    search = Search.create(search_params)
    render json: search
  end

  def show
    search = Search.find_by(id: params[:id])
    render json: search
  end

  private

  def search_params
    params.require(:search).permit(:id, :user_id, :csv)
  end
end
