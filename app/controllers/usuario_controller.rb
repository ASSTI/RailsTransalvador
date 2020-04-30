class UsuarioController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def show
      @Usuario = Usuario.find(params[:id]) 
      render json: @Usuario
    end
  
    def index
      @Usuario = Usuario.all 
      render json: @Usuario
    end
  
    def update
      @Usuario = Usuario.find(params[:id])  
      if @Usuario.update(usuario_params)
        render json: @Usuario
      else
        render json: @Usuario.errors, status: :unprocessable_entity
      end      
    end  
    
    def create
       @Usuario = Usuario.new(usuario_params)
       if @Usuario.save
         render json: @Usuario, status: :created, location: @Usuario
       else
         render json: @Usuario.errors, status: :unprocessable_entity
       end
    end
  
    def usuario_params
       params.require(:usuario).permit(:id,
                                       :nome,
                                       :login, 
                                       :senha, 
                                       :ativo, 
                                       :ultimo_acesso, 
                                       :id_grupo,
                                       :data_ativacao, 
                                       :data_reset, 
                                       :flag_reset, 
                                       :cadastro)
    end   
  end
  