class OrgaoEmissorSerializer < ActiveModel::Serializer
  attributes :id, :nome

  #has_many :municipio

  # include_nested_association:true 
  # include:true
  
end
