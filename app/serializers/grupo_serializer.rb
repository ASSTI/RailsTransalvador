class GrupoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :url

  has_many :usuario
end
