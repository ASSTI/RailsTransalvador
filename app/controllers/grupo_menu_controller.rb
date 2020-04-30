class GrupoMenuController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def todos
      @GrupoMenu = GrupoMenu.all 
    end
  
    def show
      @GrupoMenu = GrupoMenu.find(params[:id]) 
      render json: @GrupoMenu
    end
  
    def index
      @GrupoMenu = GrupoMenu.all 
      render json: @GrupoMenu
    end
  
    def update
      @GrupoMenu = GrupoMenu.find(params[:id])  
      if @GrupoMenu.update(grupo_menu_params)
        render json: @GrupoMenu
      else
        render json: @GrupoMenu.errors, status: :unprocessable_entity
      end      
    end  
    
    def create
       @GrupoMenu = GrupoMenu.new(grupo_menu_params)
       if @GrupoMenu.save
         render json: @GrupoMenu, status: :created, location: @GrupoMenu
       else
         render json: @GrupoMenu.errors, status: :unprocessable_entity
       end
    end
 
    def grupo_menu_params
       params.require(:GrupoMenu).permit(:grm_id_grm,:grm_id_gru,:grm_id_men)
    end   
  end
  
