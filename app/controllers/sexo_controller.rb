class SexoController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @Sexo = Sexo.find(params[:id]) 
    render json: @Sexo
  end

  def index
    @Sexo = Sexo.all 
    render json: @Sexo
  end

  def update
    @Sexo = Sexo.find(params[:id])  
    if @Sexo.update(sexo_params)
      render json: @Sexo
    else
      render json: @Sexo.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @Sexo = Sexo.new(sexo_params)
     if @Sexo.save
       render json: @Sexo, status: :created, location: @Sexo
     else
       render json: @Sexo.errors, status: :unprocessable_entity
     end
  end

  def sexo_params
     params.require(:sexo).permit(:sex_id_sex,:sex_nom_sexo)
  end   
end
