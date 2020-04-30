class MunicipioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @Municipio = Municipio.find(params[:id])
    # json_results =  @estado.map do |item|{  
    #      id:item['est_id_est'], 
    #      nome:item['est_nom_estado'], 
    #      uf:item['est_sigla_estado'] 
    # } end
    # render json: json_results 
    render json: @Municipio
    #, include: ['estado'] 
  end

  def index
    #url exempĺo 172.22.9.56:8000/pais/todos.{json,xml,html}
    @Municipio = Municipio.all 
    render json: @Municipio
    #, include: ['estado']
    # json_results = [] 
    # json_results = @Estado.map do |p| {  
    #      id:p.pai_id_pai, 
    #      nome:p.pai_nom_pais

    # } end
    # render json: json_results 
    # #@dados = @pais.map{|pai_id_pai,pai_nom_pais}|

    # respond_to do |format|
    #   format.html 
    #   format.xml  { render xml: @pais }
    #   format.json 
    # end
  end
end
