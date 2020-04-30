class MenuSerializer < ActiveModel::Serializer
  attributes :id,:nome,:descricao,:html_icon,:action,:controller,:is_guest,:is_admin,:modulo,:ativo,
             :menu_pai,:posicao,:url,:csi,:icone,:path,:nivel,:cor

  belongs_to :menu
  #has_many :menu

  # include_nested_association:true 
  # include:true
end
