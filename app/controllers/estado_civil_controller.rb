class EstadoCivilController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @EstadoCivil = EstadoCivil.find(params[:id]) 
    render json: @EstadoCivil
  end

  def index
    @EstadoCivil = EstadoCivil.all 
    render json: @EstadoCivil
  end

  def update
    @EstadoCivil = EstadoCivil.find(params[:id])  
    if @EstadoCivil.update(estado_params)
      render json: @EstadoCivil
    else
      render json: @EstadoCivil.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @EstadoCivil = EstadoCivil.new(estado_params)
     if @EstadoCivil.save
       render json: @EstadoCivil, status: :created, location: @EstadoCivil
     else
       render json: @EstadoCivil.errors, status: :unprocessable_entity
     end
  end

  def estado_params
     params.require(:estado_civil).permit(:esc_id_esc,:esc_nom_esc)
  end   
end
