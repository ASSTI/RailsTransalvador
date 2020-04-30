class EstadoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :uf

  belongs_to :pais
  has_many :municipio

  # include_nested_association:true 
  # include:true
  
end
