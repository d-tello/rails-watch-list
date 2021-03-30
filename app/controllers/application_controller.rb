class ApplicationController < ActionController::Base
  def index
    @lists = List.all
  end
end
