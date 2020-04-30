class PaisSerializer < ActiveModel::Serializer
    attributes :id, :nome
  
    has_many :estado
  
    # include_nested_association:true 
    # include:true
    
  end
  