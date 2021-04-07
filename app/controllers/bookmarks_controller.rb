class BookmarksController < ApplicationController
  before_action :fetch_current_bookmarks, only: [:create]

  def create
    @bookmark = Bookmark.new(movie_id: params[:bookmark][:movie_id],
                             list_id: params[:list_id], comment: params[:bookmark][:comment])
    if @bookmark.save
      redirect_to list_path(params[:list_id]), notice: 'Movie was successfully created.'
    else

      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def fetch_current_bookmarks
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
  end
end
