class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(movie_id: params[:bookmark][:movie_id], list_id: params[:list_id],
                             comment: params[:bookmark][:comment])
    if @bookmark.save
      redirect_to list_path(params[:list_id]), notice: 'Movie was successfully created.'
    else
      @list = List.find(params[:list_id])
      @bookmarks = @list.bookmarks
      render 'lists/show'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
