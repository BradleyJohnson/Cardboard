class CollectionsController < ApplicationController
  def index
    @collections = current_user.games
  end

  def create
    CreateCollectionService.new(params[:collectionData], current_user.id).call
    render :js => "window.location = '#{collection_path}'"
  end

  def import
    @parsed_response = ParseXmlService.new("https://boardgamegeek.com/xmlapi2/collection?username=#{params[:userCollection]}").call
    render json: @parsed_response
  end
end
