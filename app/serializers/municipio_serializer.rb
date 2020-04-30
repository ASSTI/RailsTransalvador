class MunicipioSerializer < ActiveModel::Serializer
  attributes :id, :nome, :uf 
  #,:nome_uf
  
  belongs_to :estado 



  #  def estado
  #      ActiveModel::SerializableResource.new(object.estados, each_serializer: EstadoSerializer)
  #  end  

end
