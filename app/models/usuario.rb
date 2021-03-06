class Usuario < ApplicationRecord
  
  ##tablename
  self.table_name = "usu_usuario"
  ##primary_key
  self.primary_key = "usu_id_usu"

  validates :usu_id_usu, presence: false
  validates :usu_nom_usuario, presence: false
  validates :usu_nom_login, presence: true
  validates :usu_num_senha, presence: true
  validates :usu_flg_ativo, presence: true
  validates :usu_dat_ultimo_acesso, presence: false
  validates :usu_id_gru, presence: true
  validates :usu_dat_ativacao_cadastro, presence: false
  validates :usu_dat_reset_senha, presence: false
  validates :usu_flg_reset_senha, presence: false
  validates :usu_dat_cadastro, presence: true

  #has_many :municipio , foreign_key: "mun_id_est"
  #belongs_to :estado , class_name: "Estado" , foreign_key: "mun_id_est"
  belongs_to :grupo , class_name: "Grupo" ,foreign_key: "usu_id_gru"
  
  alias_attribute :id,"usu_id_usu"
  alias_attribute :nome,"usu_nom_usuario"
  alias_attribute :login,"usu_nom_login"
  alias_attribute :senha,"usu_num_senha"
  alias_attribute :ativo,"usu_flg_ativo"
  alias_attribute :ultimo_acesso,"usu_dat_ultimo_acesso"
  alias_attribute :id_grupo,"usu_id_gru"
  alias_attribute :data_ativacao,"usu_dat_ativacao_cadastro"
  alias_attribute :data_reset,"usu_dat_reset_senha"
  alias_attribute :flag_reset,"usu_flg_reset_senha"
  alias_attribute :cadastro,"usu_dat_cadastro"

  def auth_usuario(usu)
    valor = Usuario.find_by usu_nom_login: usu
    if valor.present?
       resposta = { 
            valid:true,
            message: 'Usuario existe',
            dados: {
			      id: valor.id,
					nome: valor.nome,
					login: valor.login,
					id_grupo: valor.id_grupo,
					grupo: valor.grupo.nome
			   }	
					
       } 
    else
       resposta = { 
           valid:false,
           message: 'Usuario não existe',
           #val: valor
       }  
    end  
    
    return resposta
  
  end  

  def auth_usuario_pwd(usu,pwd)
    valor = Usuario.where("usu_nom_login = :usu and usu_num_senha = :pwd",
    {usu: usu, pwd: pwd})
    if valor.present?
      resposta = { 
         valid:true,
         message: 'Usuário autenticado',
         dados: {
			      id: valor[0].usu_id_usu,
               nome: valor[0].usu_nom_usuario,
				   login: valor[0].usu_nom_login,
				   id_grupo: valor[0].usu_id_gru,
				   grupo: valor[0].grupo.nome
			}	
      } 
    else
       resposta = { 
          valid:false,
          message: 'Usuário não existe ou senha inválida',
          #val: valor
       }  
    end  
    
    return resposta
  
  end  

end
