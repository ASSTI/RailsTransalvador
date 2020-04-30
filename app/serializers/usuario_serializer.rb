class UsuarioSerializer < ActiveModel::Serializer
  attributes :id, :nome, :login, :senha, :ativo, :ultimo_acesso, :id_grupo,
  :data_ativacao, :data_reset, :flag_reset, :cadastro

  belongs_to :grupo
  
end
