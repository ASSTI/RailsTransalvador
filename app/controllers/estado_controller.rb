class EstadoController < ApplicationController
  skip_before_action :verify_authenticity_token

  def todos
    @estado = Estado.all 
  end

  def show
    @Estado = Estado.find(params[:id]) 
    render json: @Estado
  end

  def index
    @Estado = Estado.all 
    render json: @Estado
  end

  def update
    @Estado = Estado.find(params[:id])  
    if @Estado.update(estado_params)
      render json: @Estado
    else
      render json: @Estado.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @Estado = Estado.new(estado_params)
     if @Estado.save
       render json: @Estado, status: :created, location: @Estado
     else
       render json: @Estado.errors, status: :unprocessable_entity
     end
  end

  def estado_params
     params.require(:estado).permit(:est_id_est,:est_nom_estado,:est_sigla_estado)
  end   
end
