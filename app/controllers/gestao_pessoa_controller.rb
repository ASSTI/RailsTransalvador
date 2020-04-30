class GestaoPessoaController < ApplicationController
  # by_pass token no put e post  
  skip_before_action :verify_authenticity_token  
 
  def show
    @GestaoPessoa = GestaoPessoa.find(params[:id])
    render json: @GestaoPessoa 
  end

  def index
    @GestaoPessoa = GestaoPessoa.all 
    render json: @GestaoPessoa
  end

  def update
    @GestaoPessoa = GestaoPessoa.find(params[:id])  
    if @GestaoPessoa.update(gestao_pessoa_params)
      render json: @GestaoPessoa
    else
      render json: @GestaoPessoa.errors, status: :unprocessable_entity
    end      
  end  
  
  def create
     @GestaoPessoa = GestaoPessoa.new(GestaoPessoa_params)
     if @GestaoPessoa.save
       render json: @GestaoPessoa, status: :created, location: @GestaoPessoa
     else
       render json: @GestaoPessoa.errors, status: :unprocessable_entity
     end
  end

  def gestao_pessoa_params
     params.require(:gestao_pessoa).permit(:gpe_id_gpe,:gpe_nom_pessoa,:gpe_nom_sobre_pessoa,:gpe_dat_nascimento,:gpe_dat_cadastro)
  end   
end

