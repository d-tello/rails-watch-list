class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:list_id]
    @bookmark.movie_id = params[:bookmark][:movie_id]

    if @bookmark.save
      redirect_to list_path(params[:list_id]), notice: 'Movie was successfully created.'
    else
      render 'list/new'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
