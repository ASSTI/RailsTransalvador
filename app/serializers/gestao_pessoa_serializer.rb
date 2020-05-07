class GestaoPessoaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :nascimento, :sobrenome, :cadastro
  #attributes :gpe_nom_pessoa, key: :nome
  # attributes :gpe_dat_nascimento, key: :nascimento
  # attributes :gpe_nom_sobre_pessoa, key: :sobrenome
  # attributes :gpe_dat_cadastro, key: :cadastro
  
  # def id 
  #   object.gpe_id_gpe
  # end  
  
  # def nome 
  #   object.gpe_nom_pessoa
  # end  

   def nascimento
      if (!object.gpe_dat_nascimento.nil?)
        object.gpe_dat_nascimento.strftime("%d/%m/%Y")
      end  
   end  

  # def sobrenome 
  #   object.gpe_nom_sobre_pessoa
  # end  

  def cadastro 
     object.gpe_dat_cadastro.strftime("%d/%m/%Y")
  end  

end

