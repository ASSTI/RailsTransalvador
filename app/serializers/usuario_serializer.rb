class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nome, :login, :senha, :ativo, :ultimo_acesso, :id_grupo,
  :data_ativacao, :data_reset, :flag_reset, :cadastro

  belongs_to :grupo
  
  def ultimo_acesso
    if (!object.usu_dat_ultimo_acesso.nil?)
      object.usu_dat_ultimo_acesso.strftime("%d/%m/%Y")
    end  
  end  

  def data_ativacao
    if (!object.usu_dat_ativacao_cadastro.nil?)
      object.usu_dat_ativacao_cadastro.strftime("%d/%m/%Y")
    end  
  end  

  def data_reset
    if (!object.usu_dat_reset_senha.nil?)
      object.usu_dat_reset_senha.strftime("%d/%m/%Y")
    end  
  end  

  def cadastro
    if (!object.usu_dat_cadastro.nil?)
      object.usu_dat_cadastro.strftime("%d/%m/%Y")
    end  
  end  
end
