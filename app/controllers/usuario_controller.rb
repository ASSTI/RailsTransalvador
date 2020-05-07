class UsuarioController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def auth
      @Usuario = Usuario.new 
      @valor = @Usuario.auth_usuario(params[:usu_nom_login])
      render json: @valor 
    end  

    def auth_pwd
      @Usuario = Usuario.new 
      @valor = @Usuario.auth_usuario_pwd(params[:usu_nom_login],params[:usu_num_senha])
      render json: @valor 
    end

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
        params.require(:usuario).permit(:usu_id_usu,
                                        :usu_nom_usuario,
                                        :usu_nom_login,
                                        :usu_num_senha,
                                        :usu_flg_ativo,
                                        :usu_dat_ultimo_acesso,
                                        :usu_id_gru,
                                        :usu_dat_ativacao_cadastro,
                                        :usu_dat_reset_senha,
                                        :usu_flg_reset_senha,
                                        :usu_dat_cadastro
                                        )
    end   
  end
  