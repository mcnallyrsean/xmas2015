class GiftsController < ApplicationController
  before_action :authenticate_admin!, except: [:home, :index, :show]

  def home
  end

  def index
    @gifts = Gift.all
  end

  def new
  end

  def create
    @gift = Gift.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      url: params[:url],
      user_id: current_user.id
      )
  end

  def show
    @gift = Gift.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
