class CommentsController < ApplicationController
	
		
	before_action :ensure_signed_in
	before_action :load_comment, only: [:show, :edit, :update, :destroy]
	before_action :set_foto

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(create_params)
    @comment.user_id = current_user.id
    @comment.foto_id = @foto.id

    if @comment.save
      flash[:notice] = 'Comment Posted'
      redirect_to "/fotos"
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(update_params)
      flash[:notice] = 'Comment updated!'
      redirect_to "/fotos"
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @comment.destroy!

    flash[:notice] = 'Comment removed!'
    redirect_to "/fotos"
  end

  private

  def create_params
    params.require(:comment).permit(:comment)
  end

  def update_params
    params.require(:comment).permit(:comment)
  end

  def load_comment
    @comment = current_foto.comments.find(params[:id])
  end
  
  def set_foto
	  @foto = Foto.find(params[:foto_id])
  end

end
