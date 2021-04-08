class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.all
    @line = home_page_line
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
      redirect_to root_path
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
