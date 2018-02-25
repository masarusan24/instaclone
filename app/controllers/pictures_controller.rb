class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login, only: [:new, :show, :edit, :destroy]
  before_action :authorize_action, only: [:edit, :destroy]

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
    else
      @picture = current_user.pictures.build
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    @picture.image.retrieve_from_cache! params[:cache][:image] unless params[:cache].nil?
    if @picture.save
      ContactMailer::create_picture_mail(@picture).deliver
      redirect_to pictures_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def index
    @pictures = Picture.index
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, flash: { danger: t('.success') }
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def confirm
    @picture = current_user.pictures.new(picture_params)
    render :new if @picture.invalid?
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, flash: { info: t('.success') }
    else
      render :edit
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :user_id, :image)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, flash: { warning: t(:please_login) }
    end
  end

  def authorize_action
    authorize! @picture
  end
end
