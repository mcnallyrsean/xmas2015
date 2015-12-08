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
    flash[:success] = "Gift request sent to Santa!"
    redirect_to "/gifts/#{@gift.id}"
  end

  def show
    @gift = Gift.find_by(id: params[:id])
  end

  def edit
    @gift = Gift.find_by(id: params[:id])
  end

  def update
    @gift = Gift.find_by(id: params[:id])
    @gift.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      url: params[:url],
      user_id: current_user.id
      )
    flash[:info] = "Gift updated. We'll pass it along to St. Nick!"
    redirect_to "/gifts/#{@gift.id}"
  end

  def destroy
    gift = Gift.find_by(id: params[:id])
    gift.destroy!
    flash[:danger] = "Gift request has been yanked from Santa's hands."
    redirect_to "/gifts"
  end
end
