class FeedsController < ApplicationController
	
  def index
    @fotos = Foto.all
  end
  
end