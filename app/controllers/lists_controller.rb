class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render 'lists/index'
      raise
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render 'lists/show'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
