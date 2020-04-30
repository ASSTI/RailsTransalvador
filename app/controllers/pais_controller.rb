class PaisController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @Pais = Pais.find(params[:id]) 
    render json: @Pais
  end

  def index
    @Pais = Pais.all 
    render json: @Pais
  end

  def update
    @Pais = Pais.find(params[:id])  
    if @Pais.update(pai_params)
      render json: @Pais
    else
      render json: @Pais.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @Pais = Pais.new(pai_params)
     if @Pais.save
       render json: @Pais, status: :created, location: @Pais
     else
       render json: @Pais.errors, status: :unprocessable_entity
     end
  end

  def pai_params
     params.require(:pai).permit(:pai_id_pai,:pai_nom_pais)
  end   
end
