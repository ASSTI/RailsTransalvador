class OrgaoEmissorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @OrgaoEmissor = OrgaoEmissor.find(params[:id]) 
    render json: @OrgaoEmissor
  end

  def index
    @OrgaoEmissor = OrgaoEmissor.all 
    render json: @OrgaoEmissor
  end

  def update
    @OrgaoEmissor = OrgaoEmissor.find(params[:id])  
    if @OrgaoEmissor.update(orgao_emissor_params)
      render json: @OrgaoEmissor
    else
      render json: @OrgaoEmissor.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @OrgaoEmissor = OrgaoEmissor.new(orgao_emissor_params)
     if @OrgaoEmissor.save
       render json: @OrgaoEmissor, status: :created, location: @OrgaoEmissor
     else
       render json: @OrgaoEmissor.errors, status: :unprocessable_entity
     end
  end

  def orgao_emissor_params
     params.require(:orgao_emissor).permit(:oem_id_ome,:oem_nom_orgao_emissor)
  end   
end
