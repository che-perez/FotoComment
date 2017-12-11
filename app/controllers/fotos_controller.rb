class FotosController < ApplicationController
	
	before_action :ensure_signed_in
	before_action :load_foto, only: [:show, :edit, :update, :destroy]

  def new
    @foto = Foto.new
  end

  def create
    @foto = Foto.new(create_params)
    @foto.user = current_user

    if @foto.save
      flash[:notice] = 'Foto Uploaded'
      redirect_to foto_path(@foto)
    else
      flash[:error] = @foto.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @foto.update(update_params)
      flash[:notice] = 'Foto updated!'
      redirect_to foto_path(@foto)
    else
      flash[:error] = @foto.errors.full_messages.join(', ')
      render :edit
    end
    
  end

  def index
    @fotos = current_user.fotos
  end

  def show
	 @comments = Comment.where(foto_id: @foto.id).order("created_at ASC")
  end

  def destroy
    @foto.destroy!

    flash[:notice] = "#{@foto.name} removed!"
    redirect_to "/fotos"
  end

  private

  def create_params
    params.require(:foto).permit(:name, :image)
  end

  def update_params
    params.require(:foto).permit(:name, :image)
  end

  def load_foto
    @foto = current_user.fotos.find(params[:id])
  end
end
