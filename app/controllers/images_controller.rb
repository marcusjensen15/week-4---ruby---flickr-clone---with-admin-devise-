class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit, :update, :destroy]


  # GET /images
  def index
    @images = Image.all
  end


  def show
    @user = current_user
    @tags = Tag.all
  end

  # GET /images/new
  def new
    @user = current_user
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @user = current_user
    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    @image = Image.find(params[:id])
    if params[:image]
      if params[:image].fetch("favorite") == "1"
        @image.update_attribute(:favorite, true)
        redirect_to image_path(@image)
        return
      elsif params[:image].fetch("favorite") == "0"
        @image.update_attribute(:favorite, false)
        redirect_to image_path(@image)
        return
      end
    end

    @tag = Tag.find(params[:tags].fetch("name").to_i)
    @image.tags << @tag
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  def add
    @image = Image.find(params[:id])
    # Division.where(name: employee_params.fetch("division_id")).first.id)
    tag = Tag.find()
    # binding.pry
    @image.tags << tag
    flash[:notice] = "Tag Added"
    redirect_to image_path(@image)

  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.permit(:img, :user_id, :favorite, :image_upload, :id)
  end
end
