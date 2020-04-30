class Municipio < ApplicationRecord
  ##tablename
  self.table_name = "mun_municipio"
  ##primary_key
  self.primary_key = "mun_id_mun"

  belongs_to :estado , class_name: "Estado" , foreign_key: "mun_id_est"

  alias_attribute :id, "mun_id_mun"
  alias_attribute :nome, "mun_nom_municipio"
  alias_attribute :uf, "mun_id_est"
  #alias_attribute :estados, "est_nom_estado"

end


