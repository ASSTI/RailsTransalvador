class GrupoController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def todos
      @Grupo = Grupo.all 
    end
  
    def show
      @Grupo = Grupo.find(params[:id]) 
      render json: @Grupo
    end
  
    def index
      @Grupo = Grupo.all 
      render json: @Grupo
    end
  
    def update
      @Grupo = Grupo.find(params[:id])  
      if @Grupo.update(Grupo_params)
        render json: @Grupo
      else
        render json: @Grupo.errors, status: :unprocessable_entity
      end      
    end  
    
    def create
       @Grupo = Grupo.new(Grupo_params)
       if @Grupo.save
         render json: @Grupo, status: :created, location: @Grupo
       else
         render json: @Grupo.errors, status: :unprocessable_entity
       end
    end
  
    def grupo_params
       params.require(:grupo).permit(:gru_id_gru,:gru_nom_grupo,:gru_url_padrao)
    end   
  end
  
