class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.paginate(page: params[:page], per_page: 6)
    @line = home_page_line
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.paginate(page: params[:page], per_page: 6).where(list_id: params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    redirect_to list_path(@list) if @list.save
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

  def home_page_line
    line = ['which film do you want to watch this evening?',
            'have you already added the film your friend suggested to your list?',
            'have you added your favourite film to the list yet?',
            'which is your favourite action movie?',
            'which is your favourite adventure movie?',
            'do you maybe want to watch a comedy?']
    line.sample
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
